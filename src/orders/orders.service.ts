import { HttpException, HttpStatus, Injectable, Post } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { EntityManager, QueryFailedError, Repository } from 'typeorm';
import { Order } from './entities/orders.entity';
import { CreateOrderDto } from './dto/create-order.dto';
import { OrderItems } from './entities/order-items.entity';

@Injectable()
export class OrdersService {
    constructor(
        @InjectRepository(Order)
        private orderRepository: Repository<Order>,

        @InjectRepository(OrderItems)
        private orderItemsRepository: Repository<OrderItems>,
    ) {}

    async create(data: CreateOrderDto) {
        try {
            const savedOrder = await this.orderRepository.manager.transaction(
                async (manager: EntityManager) => {
                    const order = this.orderRepository.create({
                        name: data.name,
                        phone: data.phone
                    })
                    
                    const savedOrder = await manager.save(order);                

                    const orderItems = data.content.map((item) => {
                        return this.orderItemsRepository.create({
                            orderId: savedOrder.id,
                            itemId: item.itemId,
                            count: item.count
                        })
                    })

                    await manager.save(orderItems)

                    return savedOrder
                }
            )
            const order = await this.orderRepository
                .createQueryBuilder('order')
                .leftJoinAndSelect('order.content', 'content')
                .select([
                    'order.id',
                    'order.name',
                    'order.phone',
                    'content.itemId',
                    'content.count'
                ])
                .where('order.id = :id', { id: savedOrder.id })
                .getOne();
            
            return order;
        }
        catch (error) {
            // Обработка если itemId неверный, возвращает на подобие такого "Ключ (itemId)=(fdb9661f-3be3-46ef-b27e-ba0facd04868) отсутствует в таблице \"items\"."
            if(error instanceof QueryFailedError && error.driverError?.code === '23503') {
                // console.log(error);
                throw new HttpException(error.driverError.detail, HttpStatus.BAD_REQUEST);
            }
            
            throw new HttpException('Ошибка при создании заказа', HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
