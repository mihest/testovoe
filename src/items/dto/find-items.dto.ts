import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString, IsUUID } from 'class-validator';
import { CountryResponseDto } from 'src/countries/dto/country.dto';

export class FindItemsDto {
    @IsOptional()
    @IsString()
    @ApiProperty({
        example: "Москва",
        required: false
    })
    title: string

    @IsOptional()
    @IsString()
    @ApiProperty({
        example: "Россия",
        required: false
    })
    country: string
}

export class FindItemByIdDto {
    @IsUUID()
    @ApiProperty({
        example: "93f4e7c3-797e-47bf-844a-8d943a5be754",
        required: true
    })
    id: string;
}

export class FindItemByIdResponseDto {
    @ApiProperty({
      example: '93f4e7c3-797e-47bf-844a-8d943a5be754',
      description: 'Уникальный идентификатор тура',
    })
    id: string;
  
    @ApiProperty({
      example: '45fb3f53-b9a1-4a1a-b320-a302dd01b87c',
      description: 'Идентификатор страны, к которой относится тур',
    })
    countryId: string;
  
    @ApiProperty({
      example: 'Париж',
      description: 'Название тура',
    })
    title: string;
  
    @ApiProperty({
      example: 150000,
      description: 'Цена тура в рублях',
    })
    price: number;
  
    @ApiProperty({
      example: 'paris.jpg',
      description: 'Изображение тура (имя файла или URL)',
    })
    image: string;
  
    @ApiProperty({
      example: '<p>Париж, город любви и искусства...</p>',
      description: 'Описание тура в формате HTML',
    })
    description: string;
  
    @ApiProperty({
      example: 6,
      description: 'Продолжительность тура в днях',
    })
    duration: number;
}


export class FindItemsResponseDto {
  @ApiProperty({
    example: 'fdb9661f-3be3-46ef-b27e-ba0facd04867',
    description: 'Уникальный идентификатор тура',
  })
  id: string;

  @ApiProperty({
    example: '75078e4b-784f-4196-a9da-547938798c2b',
    description: 'ID страны',
  })
  countryId: string;

  @ApiProperty({
    example: 'Москва',
    description: 'Название тура',
  })
  title: string;

  @ApiProperty({
    example: 200000,
    description: 'Цена тура',
  })
  price: number;

  @ApiProperty({
    example: 'moscow.jpg',
    description: 'Файл изображения тура',
  })
  image: string;

  @ApiProperty({
    example: '<p>Приглашаем вас в увлекательное путешествие...</p>',
    description: 'Описание тура в HTML-формате',
  })
  description: string;

  @ApiProperty({
    example: 5,
    description: 'Длительность тура в днях',
  })
  duration: number;

  @ApiProperty({ type: CountryResponseDto })
  country: CountryResponseDto;
}
