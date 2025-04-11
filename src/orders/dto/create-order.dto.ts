import { Type } from "class-transformer";
import { ArrayMinSize, IsArray, IsMobilePhone, IsNotEmpty, IsPhoneNumber, IsString, Length, ValidateNested } from "class-validator";
import { CreateOrderItemDto } from "./create-order-item.dto";
import { ApiProperty } from "@nestjs/swagger";

export class CreateOrderDto {
    @IsArray()
    @ArrayMinSize(1)
    @ValidateNested({ each: true })
    @Type(() => CreateOrderItemDto)
    @ApiProperty({ type: [CreateOrderItemDto] })
    content: CreateOrderItemDto[]

    @IsString()
    @IsNotEmpty()
    @Length(2, 50)
    @ApiProperty({
        example: "Danil",
        required: true
      })
    name: string

    // @IsPhoneNumber("RU")
    @IsMobilePhone()
    @ApiProperty({
        example: "+79111111111",
        required: true,
    })
    phone: string
}


export class OrderResponseDto {
    @ApiProperty({
        example: "93f4e7c3-797e-47bf-844a-8d943a5be754"
    })
    id: string;
  
    @ApiProperty()
    name: string;
  
    @ApiProperty()
    phone: string;
  
    @ApiProperty({ type: [CreateOrderItemDto] })
    content: CreateOrderItemDto[];
  }
