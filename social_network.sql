-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Dez-2020 às 14:47
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `social_network`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Hi!', 'grazziano_fagundes', 'jill_valentine', '2020-12-03 21:02:24', 'no', 4),
(2, 'Verdade, também estou gostando muito!', 'grazziano_fagundes', 'lara_croft', '2020-12-03 21:03:34', 'no', 11),
(3, 'Como você está?', 'grazziano_fagundes', 'lara_croft', '2020-12-03 21:49:24', 'no', 11),
(4, 'Boa noite Dill.\r\nComo vai?', 'grazziano_fagundes', 'jill_valentine', '2020-12-19 20:49:45', 'no', 9),
(5, 'Eu já comprei vários jogos.', 'grazziano_fagundes', 'lara_croft', '2020-12-19 20:51:24', 'no', 10),
(6, 'Eu não sou do RS, mas sempre tive vontade de conhecer.', 'lara_croft', 'grazziano_fagundes', '2020-12-19 20:52:54', 'no', 15),
(7, 'Eu amo rock!', 'lara_croft', 'grazziano_fagundes', '2020-12-19 20:53:11', 'no', 13),
(8, 'Eu também amo rock!', 'jill_valentine', 'grazziano_fagundes', '2020-12-19 20:53:54', 'no', 13),
(9, 'Merry Christmas!', 'grazziano_fagundes', 'jill_valentine', '2020-12-25 00:23:56', 'no', 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `friend_request`
--

CREATE TABLE `friend_request` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(1, 'grazziano_fagundes', 9),
(2, 'grazziano_fagundes', 4),
(3, 'grazziano_fagundes', 11),
(7, 'grazziano_fagundes', 15),
(8, 'grazziano_fagundes', 13),
(9, 'grazziano_fagundes', 14),
(10, 'homer_simpson', 23),
(11, 'lara_croft', 24),
(12, 'grazziano_fagundes', 22),
(13, 'grazziano_fagundes', 24),
(14, 'grazziano_fagundes', 21),
(15, 'grazziano_fagundes', 20),
(16, 'grazziano_fagundes', 19),
(17, 'grazziano_fagundes', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'jill_valentine', 'grazziano_fagundes', 'Hey Jill!', '2020-12-27 10:47:15', 'no', 'no', 'no'),
(2, 'jill_valentine', 'grazziano_fagundes', 'Hello!', '2020-12-27 10:47:40', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'This is the first post!', 'grazziano_fagundes', 'none', '2020-11-29 21:07:38', 'no', 'no', 0),
(2, 'Olá eu sou a Jill e este é o meu primeiro post nessa rede social.', 'jill_valentine', 'none', '2020-11-30 16:07:19', 'no', 'no', 0),
(3, 'Resident Evil é um dos melhores survivor horrors já feito.\nQuem concorda?\nDeixa o like.', 'jill_valentine', 'none', '2020-11-30 16:46:48', 'no', 'no', 0),
(4, 'Hi there guys!', 'jill_valentine', 'none', '2020-11-30 16:52:15', 'no', 'no', 1),
(5, 'Boa noite a todos!', 'grazziano_fagundes', 'none', '2020-11-30 23:47:27', 'no', 'no', 0),
(6, 'Olá. como estão todos?\nEu sou novo nessa rede social.', 'grazziano_fagundes_1', 'none', '2020-12-01 22:13:07', 'no', 'no', 0),
(7, 'Olá, eu sou a Lara.\nJá conferiram o meu novo jogo?', 'lara_croft', 'none', '2020-12-01 22:14:04', 'no', 'no', 0),
(8, 'Quem aqui gosta de games?', 'grazziano_fagundes', 'none', '2020-12-01 22:14:37', 'no', 'no', 0),
(9, 'Boa noite a todos!', 'jill_valentine', 'none', '2020-12-01 22:15:11', 'no', 'no', 1),
(10, 'Promoção de games na Steam.\nAproveitem!!!', 'lara_croft', 'none', '2020-12-01 22:16:15', 'no', 'no', 0),
(11, 'Essa rede social é muito legal!', 'lara_croft', 'none', '2020-12-01 22:16:57', 'no', 'no', 1),
(12, 'Quem aqui curte rock?\nDá uma curtida.', 'grazziano_fagundes_1', 'none', '2020-12-01 22:17:58', 'no', 'no', 0),
(13, 'Eu sou rockeiro!', 'grazziano_fagundes', 'none', '2020-12-01 22:19:04', 'no', 'no', 1),
(14, 'Quem é programador deixa o like!', 'grazziano_fagundes', 'none', '2020-12-01 22:19:32', 'no', 'no', 1),
(15, 'Quem aqui é do RS?', 'grazziano_fagundes', 'none', '2020-12-01 22:28:11', 'no', 'no', 1),
(16, 'Olá sou nova aqui!', 'claire_redfield', 'none', '2020-12-22 21:42:53', 'no', 'no', 0),
(17, 'Cheguei!!!', 'bart_simpson', 'none', '2020-12-23 19:49:17', 'no', 'no', 1),
(18, 'Hi !', 'grazziano_fagundes', 'lara_croft', '2020-12-25 00:18:09', 'no', 'yes', 0),
(19, 'Quer ser meu amigo!', 'jill_valentine', 'grazziano_fagundes', '2020-12-25 00:19:55', 'no', 'no', 1),
(20, 'Hi Jill!', 'grazziano_fagundes', 'jill_valentine', '2020-12-25 00:20:46', 'no', 'no', 1),
(21, 'Merry Christmas!', 'jill_valentine', 'none', '2020-12-25 00:21:51', 'no', 'no', 1),
(22, 'Merry Christmas!', 'grazziano_fagundes', 'none', '2020-12-25 00:23:45', 'no', 'no', 1),
(23, 'Hello!', 'homer_simpson', 'none', '2020-12-26 18:47:54', 'no', 'no', 1),
(24, 'Happy new year!', 'lara_croft', 'grazziano_fagundes', '2020-12-26 23:26:52', 'no', 'no', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'Grazziano', 'Fagundes', 'grazziano_fagundes', 'grazzianofagundes@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/grazziano_fagundes1b5f9b6d2cb9fd8798c8c884cc836257n.jpeg', 9, 6, 'no', ',lara_croft,grazziano_fagundes_1,jill_valentine,bart_simpson,homer_simpson'),
(2, 'Grazziano', 'Fagundes', 'grazziano_fagundes_1', 'grazziano.fagundes@outlook.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/defaults/head_pomegranate.png', 2, 0, 'no', ',lara_croftlara_croftlara_croftgrazziano_fagundes'),
(3, 'Lara', 'Croft', 'lara_croft', 'lara@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/lara_croftebb708b86c692b40820f24fa3c39d5ccn.jpeg', 4, 4, 'no', ',grazziano_fagundes,grazziano_fagundes_1grazziano_fagundes_1grazziano_fagundes_1'),
(4, 'Jill', 'Valentine', 'jill_valentine', 'jill@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/jill_valentine60a2b71c20330376a2ede139e0c45a68n.jpeg', 6, 6, 'no', ',grazziano_fagundesgrazziano_fagundesgrazziano_fagundesbart_simpson'),
(5, 'Claire', 'Redfield', 'claire_redfield', 'claire@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-12-22', 'assets/images/profile_pics/defaults/head_carrot.png', 1, 0, 'no', ','),
(6, 'Bart', 'Simpson', 'bart_simpson', 'bart@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-12-23', 'assets/images/profile_pics/bart_simpson523d124b2f747f2a62fab8ad06c96a3cn.jpeg', 1, 1, 'no', ',grazziano_fagundes,jill_valentine'),
(7, 'Homer', 'Simpson', 'homer_simpson', 'homer@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-12-24', 'assets/images/profile_pics/homer_simpson0df3c02a1b1c7905dfbfd433aae59530n.jpeg', 1, 1, 'no', ',grazziano_fagundes');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `friend_request`
--
ALTER TABLE `friend_request`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `friend_request`
--
ALTER TABLE `friend_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
