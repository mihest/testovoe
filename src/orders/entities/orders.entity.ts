import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { OrderItems } from './order-items.entity';

@Entity({ name: "orders"})
export class Order {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column({ nullable: false })
    name: string

    @Column({ type: "varchar", length: 20, nullable: false })
    phone: string

    @OneToMany(() => OrderItems, (orderItems) => orderItems.order)
    content: OrderItems[]
}
