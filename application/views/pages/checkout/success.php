<main role="main" class="container">
	<?php $this->load->view('layouts/_alert'); ?>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header bg-dark text-light">
					Checkout Berhasil

					<script type="text/javascript"
						src="https://app.sandbox.midtrans.com/snap/snap.js"
						data-client-key="SB-Mid-client-PtfxqDtD9N0bygLz">
					</script>
					<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
				</div>

				<form id="payment-form" method="post" action="<?=site_url()?>/snap/finish">
					<input type="hidden" name="result_type" id="result-type" value=""></div>
					<input type="hidden" name="result_data" id="result-data" value=""></div>
				</form>

				<div class="card-body">
					<h5>Nomor Order: <?= $content->invoice ?></h5>
					<p>Halo, Pelanggan Tiara Brand.</p>
					<p>Terima kasih, sudah berbelanja di <strong>Tiara Brand Indonesia</strong>.</p>
					<p>Silahkan lakukan pembayaran untuk bisa kami proses selanjutnya dengan cara:</p>
					<ol>
						<li>Klik tombol <strong>Bayar Pesanan</strong> di kanan bawah halaman ini.</li>
						<li>Total Pembayaran: <strong>Rp. <?= number_format($content->total, 0, ',','.') ?>,-</strong>
						</li>
					</ol>
					<p>Terima kasih sudah berbelanja di <strong>Tiara Brand Indonesia</strong>.</p>
					<a href="<?= base_url('/') ?>" class="btn btn-primary"><i class="fas fa-angle-left"></i> Kembali</a>

					<button id="pay-button" class="btn btn-primary float-right">Bayar Pesanan<i class="fas fa-angle-right"></i></button>
					<script type="text/javascript">
						$('#pay-button').click(function (event) {
							event.preventDefault();
							$(this).attr("disabled", "disabled");

							$.ajax({
								url: '<?=site_url()?>/snap/token',
								cache: false,

								success: function (data) {
									//location = data;

									console.log('token = ' + data);

									var resultType = document.getElementById('result-type');
									var resultData = document.getElementById('result-data');

									function changeResult(type, data) {
										$("#result-type").val(type);
										$("#result-data").val(JSON.stringify(data));
										//resultType.innerHTML = type;
										//resultData.innerHTML = JSON.stringify(data);
									}

									snap.pay(data, {

										onSuccess: function (result) {
											changeResult('success', result);
											console.log(result.status_message);
											console.log(result);
											$("#payment-form").submit();
										},
										onPending: function (result) {
											changeResult('pending', result);
											console.log(result.status_message);
											$("#payment-form").submit();
										},
										onError: function (result) {
											changeResult('error', result);
											console.log(result.status_message);
											$("#payment-form").submit();
										}
									});
								}
							});
						});

					</script>
				</div>
			</div>
		</div>
	</div>
</main>
