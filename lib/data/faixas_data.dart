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