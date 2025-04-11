import { ApiProperty } from '@nestjs/swagger';

export class CountryResponseDto {
  @ApiProperty({
    example: '75078e4b-784f-4196-a9da-547938798c2b',
    description: 'Идентификатор страны',
  })
  id: string;

  @ApiProperty({
    example: 'Россия',
    description: 'Название страны',
  })
  title: string;
}
