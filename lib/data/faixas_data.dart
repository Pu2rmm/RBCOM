import '../models/faixa.dart';

const Faixa faixa160 = Faixa(
  nome: '160 metros',
  frequencia: '1.800 – 2.000 kHz',
  categoria: 'HF',
  segmentos: [
    SegmentoFaixa(
      frequencia: '1.800 – 1.810 kHz',
      modos: 'CW + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW e modos digitais.',
      observacao: 'Sem observação específica na tabela.',
    ),
    SegmentoFaixa(
      frequencia: '1.810 – 1.830 kHz',
      modos: 'CW',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW.',
      observacao: 'Sem observação específica na tabela.',
    ),
    SegmentoFaixa(
      frequencia: '1.830 – 1.839 kHz',
      modos: 'CW',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW para comunicações DX.',
      observacao: 'Aplicação indicada como DX.',
    ),
    SegmentoFaixa(
      frequencia: '1.839 – 1.840 kHz',
      modos: 'CW + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW e modos digitais para DX.',
      observacao:
          'DX. ACDS pode ser utilizado desde que não cause interferências em comunicações ponto a ponto e DX.',
    ),
    SegmentoFaixa(
      frequencia: '1.840 – 1.843 kHz',
      modos: 'CW + SSB + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW, SSB e modos digitais para DX.',
      observacao: 'Aplicação indicada como DX.',
    ),
    SegmentoFaixa(
      frequencia: '1.843 – 1.850 kHz',
      modos: 'CW + SSB',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW e SSB para DX.',
      observacao: 'Aplicação indicada como DX.',
    ),
    SegmentoFaixa(
      frequencia: '1.850 – 2.000 kHz',
      modos: 'CW + SSB + AM + DV + Digital + Demais modos',
      classes: 'Classe A',
      aplicacao:
          'Operação em CW, SSB, AM, DV, modos digitais e demais modos previstos.',
      observacao: 'Apenas Classe A.',
    ),
  ],
);

const List<Faixa> faixasHF = [faixa160, faixa80];
const Faixa faixa80 = Faixa(
  nome: '80 metros',
  frequencia: '3.500 – 4.000 kHz',
  categoria: 'HF',
  segmentos: [
    SegmentoFaixa(
      frequencia: '3.500 – 3.510 kHz',
      modos: 'CW',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW para DX.',
      observacao: 'Aplicação indicada como DX.',
    ),
    SegmentoFaixa(
      frequencia: '3.510 – 3.570 kHz',
      modos: 'CW',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW.',
      observacao: 'Sem observação específica na tabela.',
    ),
    SegmentoFaixa(
      frequencia: '3.570 – 3.580 kHz',
      modos: 'CW + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW e modos digitais.',
      observacao: 'Conforme Nota 3.',
    ),
    SegmentoFaixa(
      frequencia: '3.580 – 3.590 kHz',
      modos: 'CW + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW e modos digitais.',
      observacao: 'Sem observação específica na tabela.',
    ),
    SegmentoFaixa(
      frequencia: '3.590 – 3.600 kHz',
      modos: 'CW + SSB + Digital',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW, SSB e modos digitais.',
      observacao: 'ACDS.',
    ),
    SegmentoFaixa(
      frequencia: '3.600 – 3.625 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV.',
      observacao: 'ACDS.',
    ),
    SegmentoFaixa(
      frequencia: '3.625 – 3.775 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV.',
      observacao: 'Sem observação específica na tabela.',
    ),
    SegmentoFaixa(
      frequencia: '3.775 – 3.800 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Todas as classes de COER',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV para DX.',
      observacao: 'Aplicação indicada como DX.',
    ),
    SegmentoFaixa(
      frequencia: '3.800 – 3.875 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Classe A',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV.',
      observacao: 'Apenas Classe A.',
    ),
    SegmentoFaixa(
      frequencia: '3.875 – 3.900 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Classe A',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV.',
      observacao: 'Apenas Classe A.',
    ),
    SegmentoFaixa(
      frequencia: '3.900 – 4.000 kHz',
      modos: 'CW + SSB + Digital + DV',
      classes: 'Classe A',
      aplicacao: 'Operação em CW, SSB, modos digitais e DV.',
      observacao: 'Apenas Classe A.',
    ),
  ],
);
