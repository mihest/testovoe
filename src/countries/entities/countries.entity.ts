import { Item } from 'src/items/entities/items.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';

@Entity({name: "countries"})
export class Country {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column({ unique: true, nullable: false })
  title: string;

  @OneToMany(() => Item, (item) => item.country)
  items: Item[]
}
