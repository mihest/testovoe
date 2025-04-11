import { Item } from 'src/items/entities/items.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Order } from './orders.entity';

@Entity()
export class OrderItems {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    orderId: string;

    @Column()
    itemId: string;

    @ManyToOne(() => Order, (order) => order.content, { onDelete: 'CASCADE' })
    @JoinColumn({ name: "orderId" })
    order: Order;

    @ManyToOne(() => Item, (item) => item.itemOrders, { onDelete: 'CASCADE' })
    @JoinColumn({ name: "itemId" })
    item: Item;

    @Column()
    count: number;
}