-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Dez-2020 às 02:33
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estrutura da tabela `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(4, 'Hi there guys!', 'jill_valentine', 'none', '2020-11-30 16:52:15', 'no', 'no', 0),
(5, 'Boa noite a todos!', 'grazziano_fagundes', 'none', '2020-11-30 23:47:27', 'no', 'no', 0),
(6, 'Olá. como estão todos?\nEu sou novo nessa rede social.', 'grazziano_fagundes_1', 'none', '2020-12-01 22:13:07', 'no', 'no', 0),
(7, 'Olá, eu sou a Lara.\nJá conferiram o meu novo jogo?', 'lara_croft', 'none', '2020-12-01 22:14:04', 'no', 'no', 0),
(8, 'Quem aqui gosta de games?', 'grazziano_fagundes', 'none', '2020-12-01 22:14:37', 'no', 'no', 0),
(9, 'Boa noite a todos!', 'jill_valentine', 'none', '2020-12-01 22:15:11', 'no', 'no', 0),
(10, 'Promoção de games na Steam.\nAproveitem!!!', 'lara_croft', 'none', '2020-12-01 22:16:15', 'no', 'no', 0),
(11, 'Essa rede social é muito legal!', 'lara_croft', 'none', '2020-12-01 22:16:57', 'no', 'no', 0),
(12, 'Quem aqui curte rock?\nDá uma curtida.', 'grazziano_fagundes_1', 'none', '2020-12-01 22:17:58', 'no', 'no', 0),
(13, 'Eu sou rockeiro!', 'grazziano_fagundes', 'none', '2020-12-01 22:19:04', 'no', 'no', 0),
(14, 'Quem é programador deixa o like!', 'grazziano_fagundes', 'none', '2020-12-01 22:19:32', 'no', 'no', 0),
(15, 'Quem aqui é do RS?', 'grazziano_fagundes', 'none', '2020-12-01 22:28:11', 'no', 'no', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Grazziano', 'Fagundes', 'grazziano_fagundes', 'grazzianofagundes@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/defaults/head_wisteria.png', 6, 0, 'no', ','),
(2, 'Grazziano', 'Fagundes', 'grazziano_fagundes_1', 'grazziano.fagundes@outlook.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/defaults/head_pomegranate.png', 2, 0, 'no', ','),
(3, 'Lara', 'Croft', 'lara_croft', 'lara@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/defaults/head_wet_asphalt.png', 3, 0, 'no', ','),
(4, 'Jill', 'Valentine', 'jill_valentine', 'jill@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-11-26', 'assets/images/profile_pics/defaults/head_red.png', 4, 0, 'no', ',');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `post_comments`
--
ALTER TABLE `post_comments`
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
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
