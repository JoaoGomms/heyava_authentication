import '../models/onboarding_page_model.dart';

const imagePath = 'assets/images/onboarding';

List<OnboardingItemModel> onboardingPages = [
  OnboardingItemModel(
      urlImg: '$imagePath/list.svg',
      text: 'Auxílio para contar suas melhores histórias',
      label:
          'Nossos roteiros-guia ajudam você a dar o primeiro passo e começar a contar as suas melhores lembranças separadas por temas.'),
  OnboardingItemModel(
      urlImg: '$imagePath/progress.svg',
      text: 'Guarde os momentos da sua vida em um lugar especial',
      label:
          'Através da Linha do Tempo você poderá retornar ao passado, reviver e compartilhar suas lembranças mais valiosas sempre que quiser.'),
  OnboardingItemModel(
      urlImg: '$imagePath/smiley.svg',
      text: 'Relembre sentimentos de algum momento ou memória.',
      label:
          'Explore os sentimentos, emoções, conexão, reconexão e a colaboração entre as pessoas que você ama. '),
  OnboardingItemModel(
      urlImg: '$imagePath/writer.svg',
      text: 'Eternize memórias para acessá-las quando sentir saudade',
      label:
          'Na AVA, memórias são compostas por momentos, que são traduzidos em imagens, vídeos, áudios ou outros arquivos de mídia. Adicione os momentos que você quer contar e compartilhe com quem você ama!')
];
