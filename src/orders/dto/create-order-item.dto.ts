import { ApiProperty } from '@nestjs/swagger';
import { IsUUID, IsInt, Min } from 'class-validator';

export class CreateOrderItemDto {
  @IsUUID()
  @ApiProperty({
      example: "93f4e7c3-797e-47bf-844a-8d943a5be754",
      required: true
  })
  itemId: string;

  @IsInt()
  @Min(1)
  @ApiProperty({
    example: "123",
    required: true,
    minimum: 1
  })
  count: number;
}
