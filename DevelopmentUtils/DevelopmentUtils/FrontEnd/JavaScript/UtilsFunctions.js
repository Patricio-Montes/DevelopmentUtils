/* Funciones utilizadas para totalizar un importe a partir de rows checkeados */
/* El valor calculado se setea en la selda de id = totamount */

function totAmountCalculator() {
var totamount = 0;
    $(".check:checked").each(function () {
    var amount = $(this).attr("data-importe");
    totamount += parseFloat(amount.replace(".", "").replace(",", "."));
    });
    $('#totamount').text('$' + ' ' + totamount.toLocaleString('es-AR'));
    // amount se recibe de la forma #.###,##
    // y totamount se ve de la misma forma #.###,## gracias al tratamiento de replaces y a toLocalString.
};

$(function () {
      $(document).on("change", ".check", totAmountCalculator);
      totAmountCalculator();
});

$(function () {
   $(document).on("change", ".check_all", totAmountCalculator);
   totAmountCalculator();
});