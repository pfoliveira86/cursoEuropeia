# Desenvolvido por: Pedro Oliveira
echo 'A data actual e:'
date +%d/%m/%Y
# Data customizada para o formato mais normal em Portugal - dd/mm/aaaa
echo 'Introduza a directoria que pretende comprimir:'
read diretoria;
ano=$( date +%Y )
mes=$( date +%m )
dia=$( date +%d )
hora=$( date +%H )
minuto=$( date +%M )
nome_ficheiro="${ano}_${mes}_${dia}_${hora}_${minuto}_${diretoria}.gz"
# Definida var com nome ficheiro a usaer seguidamente no comando tar
tar -zcf  "${nome_ficheiro}" $diretoria 2>/dev/null
# Comando tar adaptado para nao mostrar erros ao nao detetar diretoria, e assim so mostrar a mensagem de erro customizada.
tar_status="$?"
# associado codigo de retorno a variavel
if [ $tar_status -eq 0 ];
# validar operacao tar consoante o codigo de retorno
then
echo "A directoria -> $diretoria foi comprimida com sucesso"
else
echo "Falha ao comprimir a directoria -> $diretoria, Codigo Erro identificado -> $tar_status"
fi
# Finalizado
