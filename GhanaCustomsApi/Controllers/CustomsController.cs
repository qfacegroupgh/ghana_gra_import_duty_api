        [HttpGet]
        [Route("Gets")]
        public async Task<IActionResult> Gets()
        {
            var data =await _unitOfWork.VehicleTypes.GetVehicleTypes();
            return Ok(data);
        }
