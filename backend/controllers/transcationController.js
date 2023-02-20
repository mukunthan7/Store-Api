import {PrismaClient} from "@prisma/client"
import { Router } from "express";

const prisma = new PrismaClient();
const router = Router();

const getTransaction = async(req,res) => {
    try{
        const response = await prisma.transaction.findMany({
            include: {
                productName: {
                    include: {
                        supplierName: true
                    }
                },
            }
        });
        res.status(200).json(response);
    }catch(error){
        console.log(error);
    }
}

const postTransaction = async(req,res) => {
    try{
        const { productName, quantity  } = req.body;
        const response = await prisma.transaction.create({
            data: {
                productName : {
                    connect: {
                        productName
                    }
                },
                quantity
            }
        });
        res.status(200).json(response);
    }catch(error){
        console.log(error);
    }
}

router.get("/", getTransaction);
router.post("/", postTransaction);

export default router;