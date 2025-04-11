import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Country } from './entities/countries.entity';
import { Repository } from 'typeorm';

@Injectable()
export class CountriesService {
    constructor(
        @InjectRepository(Country)
        private countryRepositury: Repository<Country>,
    ) {}

    findAll(): Promise<Country[]> {
        return this.countryRepositury.find()
    }
}
