const axios = require('axios');
const fs = require('fs');

const API_URL = 'https://restcountries.com/v3.1/all';

async function gerarInserts() {
    try {
        const response = await axios.get(API_URL);
        const paises = response.data;

        const comandosSQL = paises.map(pais => {
            const nome = pais.name?.common?.replace(/'/g,"''");
            const bandeira = pais.flags?.png

            if (nome && bandeira) {
                return `INSERT INTO TBL_PAIS (nome, bandeira, votos) VALUES ('${nome}','${bandeira}',NULL);`;
            }
            return null
        }).filter(Boolean);

        fs.writeFileSync('insert_paises.sql', comandosSQL.join('\n'), 'utf-8');
         console.log(`Gerado com sucesso: insert_paises.sql (${comandosSQL.length} linhas)`);
    } catch (erro) {
    console.error('Erro ao gerar comandos SQL:', erro.message);
  }
}

gerarInserts();
