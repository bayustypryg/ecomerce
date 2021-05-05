<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
	<div class="row">
		<div class="col-md-7">
			<div class="card">
				<div class="card-header bg-dark text-light text-center">Formulir Alamat Pengiriman</div>
				<div class="card-body">
					<form action="<?= base_url("/checkout/create") ?>" method="POST">
						<div class="form-group">
							<label for="">Nama Lengkap</label>
							<input type="text" class="form-control" name="name" placeholder="Masukkan Nama Depan" value="<?= $input->name ?>">
							<?= form_error('name') ?>
						</div>
						<div class="form-group">
							<label for="">Alamat Lengkap</label>
							<textarea name="address" id="" cols="30" rows="5" class="form-control" placeholder="Masukkan alamat lengkap"><?= $input->address ?></textarea>
							<?= form_error('address') ?>
						</div>
						<div class="form-group">
							<label for="">Telepon</label>
							<input type="text" class="form-control" name="phone" placeholder="Masukkan nomor telepon penerima" value="<?= $input->phone ?>">
							<?= form_error('phone') ?>
						</div>
						<div class="form-group">
							<label for="">E-Mail</label>
							<input type="text" class="form-control" name="email" value="<?= $this->session->userdata('email') ?>" readonly>
							<?= form_error('email') ?>
						</div>

						<button class="btn btn-primary" type="submit">Simpan</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="row">
				<div class="col-md-12">
					<div class="card mb-2">
						<div class="card-header bg-dark text-light text-center">Cart</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th class="text-center">Produk</th>
										<th>Jumlah Barang</th>
										<th class="text-center">Harga</th>
										<th class="text-center">Subtotal</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach($cart as $row) : ?>
									<tr>
										<td class="text-center"><?= $row->title ?></td>
										<td class="text-center"><?= $row->qty ?></td>
										<td>Rp.<?= number_format($row->price, 0, ',', '.') ?>,-</td>
										<td>Rp.<?= number_format($row->subtotal, 0, ',', '.') ?>,-</td>
									</tr>
									<?php endforeach ?>
								</tbody>
								<tfoot>
									<tr>
										<th colspan="2" >Total</th>
										<th></th>
										<th>Rp.<?= number_format(array_sum(array_column($cart, 'subtotal')), 0, ',', '.') ?>,-</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
