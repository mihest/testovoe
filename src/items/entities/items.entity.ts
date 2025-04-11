import { Country } from 'src/countries/entities/countries.entity';
import { OrderItems } from 'src/orders/entities/order-items.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany, JoinColumn } from 'typeorm';

@Entity({ name: "items" })
export class Item {
    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    countryId: string;

    @Column()
    title: string;

    @Column()
    price: number;

    @Column()
    image: string;
    
    @Column()
    description: string;
    
    @Column()
    duration: number;

    @ManyToOne(() => Country, (country) => country.items, { onDelete: "CASCADE", onUpdate: "CASCADE" })
    @JoinColumn({ name: "countryId" })
    country: Country

    @OneToMany(() => OrderItems, (orderItems) => orderItems.item)
    itemOrders: OrderItems[]
}
