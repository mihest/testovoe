import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Item } from './entities/items.entity';
import { FindItemsDto } from './dto/find-items.dto';

@Injectable()
export class ItemsService {
    constructor(
        @InjectRepository(Item)
        private itemRepository: Repository<Item>,
    ) {}

    findAll(filters: FindItemsDto): Promise<Item[]> {
        const query = this.itemRepository.createQueryBuilder("items").leftJoinAndSelect("items.country", 'country');
        
        if (filters.title) {
            query.andWhere("items.title ILIKE :title", {title: `%${filters.title}%`})
        }

        if (filters.country) {
            query.andWhere("country.title ILIKE :country", {country: `%${filters.country}%`})
        }

        return query.getMany()
    }

    async findOne(id: string): Promise<Item> {
        const item = await this.itemRepository.findOneBy({id: id})

        if (!item) {
            throw new HttpException('Item not found', HttpStatus.NOT_FOUND);
        }
        return item
    }
}
