// routes/seller/flowers.route.js

const express = require('express');
const router = express.Router();
const flowersController = require('../../controllers/seller/flowers.controller');

// 판매자 상품 관리 - 상품 목록 조회
router.get('/flowers', /*ensureAuthenticated*/ flowersController.getFlowers);

// 판매자 상품 관리 - 상품 등록
router.post('/flowers', flowersController.addFlower);

// 판매자 상품 관리 - 상품 수정
router.put('/flowers/:flowerId', flowersController.updateFlower);

// 판매자 상품 관리 - 상품 삭제
router.delete('/flowers/:flowerId', flowersController.deleteFlower);

// 상품 등록 페이지로 이동
router.get('/seller/flowers/add', flowersController.renderAddFlower);


module.exports = router;
