<main role="main" class="container">
	<div class="row">
		<div class="col-md-3">
			<?php $this->load->view('layouts/_menu'); ?>
		</div>
		<div class="col-md-9">
			<div class="card">
				<div class="card-header bg-dark text-light">Daftar Orders</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr class="text-center">
								<th>Nomor Order</th>
								<th>Tanggal Order</th>
								<th>Total</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody class="text-center">
                            <?php foreach($content as $row) : ?>
                                <tr>
                                    <td>
                                        <a href="<?= base_url("myorder/detail/$row->invoice") ?>"><strong><?= $row->invoice ?></strong></a>
                                    </td>
                                    <td><?= date("d-m-Y", strtotime($row->date)) ?></td>
                                    <td>Rp.<?= number_format($row->total, 0, ',', '.') ?>,-</td>
                                    <td>
                                        <?php $this->load->view('layouts/_status', ['status' => $row->status]); ?>
                                    </td>
                                </tr>
                            <?php endforeach ?>
						</tbody>
					</table>

					<nav aria-label="Page navigation example">
						<?= $pagination ?>
					</nav>
				</div>
			</div>
		</div>
	</div>
</main>
