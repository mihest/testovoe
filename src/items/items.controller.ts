import { Controller, Get, Param, Query } from '@nestjs/common';
import { ItemsService } from './items.service';
import { FindItemByIdDto, FindItemByIdResponseDto, FindItemsDto, FindItemsResponseDto } from './dto/find-items.dto';
import { ApiResponse } from '@nestjs/swagger';
import { Item } from './entities/items.entity';

@Controller('items')
export class ItemsController {
  	constructor(private readonly itemsService: ItemsService) {}

	@Get()
	@ApiResponse({status: 200, type: FindItemsResponseDto})
	findAll(@Query() filters: FindItemsDto) {		
		return this.itemsService.findAll(filters)
	}

	@Get(':id')
	@ApiResponse({status: 200, type: FindItemByIdResponseDto})
	findOne(@Param() params: FindItemByIdDto) {
		return this.itemsService.findOne(params.id)
	}
}
