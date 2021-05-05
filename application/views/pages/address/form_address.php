<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
	<div class="row">
		<div class="col-md-3">
			<?php $this->load->view('layouts/_menu'); ?>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header bg-dark text-light text-center">
							<h5><?=$title?></h5>
						</div>
						<div class="card-body">
							<form action="">
								<div class="form-group">
									<label for="nama_penerima">Nama Penerima</label>
									<input type="text" name="nama_penerima" id="nama_penerima" class="form-control">
								</div>
								<div class="form-group">
									<label for="provinsi">Provinsi</label>
									<select name="provinsi" id="provinsi" class="form-control">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group">
									<label for="kota">Provinsi</label>
									<select name="kota" id="kota" class="form-control">
										<option value=""></option>
									</select>
								</div>
								<div class="form-group">
									<label for="provinsi">Alamat Lengkap</label>
									<textarea class="form-control" name="alamat" id="alamat" rows="5"></textarea>
								</div>
								<div class="form-group">
									<label for="telepon">Telepon</label>
									<input class="form-control" type="number" name="telepon" id="telepon">
								</div>
								<div class="float-right">
									<button class="btn btn-dark">Save</button>
									<button class="btn btn-danger">Clear</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</main>
	