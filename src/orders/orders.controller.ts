import { Body, Controller, Post } from '@nestjs/common';
import { OrdersService } from './orders.service';
import { CreateOrderDto, OrderResponseDto } from './dto/create-order.dto';
import { ApiBody, ApiResponse } from '@nestjs/swagger';

@Controller('orders')
export class OrdersController {
    constructor(private readonly ordersService: OrdersService) {}

    @Post()
    @ApiResponse({ status: 201, type: OrderResponseDto })
    create(@Body() createOrder: CreateOrderDto) {
        return this.ordersService.create(createOrder)
    }
}
