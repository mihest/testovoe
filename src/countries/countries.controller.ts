import { Controller, Get, Param } from '@nestjs/common';
import { IsUUID } from 'class-validator';
import { CountriesService } from './countries.service';
import { ApiResponse } from '@nestjs/swagger';
import { CountryResponseDto } from './dto/country.dto';

class FindOneDto {
    @IsUUID()
    id: string;
  }

@Controller('countries')
export class CountriesController {
    constructor(private readonly countriesService: CountriesService) {}

    @Get()
    @ApiResponse({status:200, type: [CountryResponseDto]})
    findAll() {
        return this.countriesService.findAll()
    }
}
