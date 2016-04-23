-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 23 2016 г., 23:12
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `reviews`
--

-- --------------------------------------------------------

--
-- Структура таблицы `default_property`
--

CREATE TABLE `default_property` (
  `id` int(11) NOT NULL,
  `lvl_property` int(11) DEFAULT NULL,
  `type_property` varchar(255) DEFAULT NULL,
  `class_property` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `placeholder_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `default_property`
--

INSERT INTO `default_property` (`id`, `lvl_property`, `type_property`, `class_property`, `value`, `placeholder_property`) VALUES
(1, 1, 'text', 'name_source', '', 'Название источника'),
(2, 2, 'text', 'name_parser', '', 'Название категории'),
(3, 3, 'textarea', 'url', '', 'Ссылка на сайт'),
(4, 4, 'text', 'class_item', '', 'Класс элемента'),
(5, 5, 'text', 'next_link', '', 'класс paginator''a'),
(6, 6, 'text', 'name_item', '', 'название товара'),
(7, 7, 'text', 'code_item', '', 'код товара'),
(8, 8, 'textarea', 'exceptions', '', 'исключения'),
(9, 9, 'textarea', 'link_reviews', '', 'шаблон ссылки на отзывы'),
(10, 10, 'text', 'class_review', '', 'класс текста отзыва');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Структура таблицы `link_items`
--

CREATE TABLE `link_items` (
  `id` int(11) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `id_parser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `link_items`
--

INSERT INTO `link_items` (`id`, `url`, `id_parser`) VALUES
(372, '/products/smartfon-samsung-galaxy-core-prime-ve-sm-g361h-gray-30022654', 1),
(373, '/products/smartfon-lg-g4-h818-black-leather-30022404', 1),
(374, '/products/smartfon-lenovo-vibe-shot-z90a40-red-30022729', 1),
(375, '/products/smartfon-microsoft-lumia-640-ds-white-30022417', 1),
(376, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-pink-gold-30024250', 1),
(377, '/products/smartfon-lg-k10-3g-k410-white-30024310', 1),
(378, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-white-pearl-30022040', 1),
(379, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-silver-titanium-30024654', 1),
(380, '/products/smartfon-lenovo-vibe-p1m-black-30023771', 1),
(381, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-white-30024251', 1),
(382, '/products/smartfon-sony-xperia-z5-e6653-pink-30024321', 1),
(383, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-gold-30024213', 1),
(384, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-gold-platinum-30024652', 1),
(385, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-silver-titanium-30024650', 1),
(386, '/products/smartfon-asus-zenfone-5-a502cg-2b066ru-white-30021923', 1),
(387, '/products/smartfon-huawei-nexus-6p-64gb-silver-30024153', 1),
(388, '/products/smartfon-prestigio-muze-d3-psp-3530-duo-gold-30024432', 1),
(389, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-green-30023050', 1),
(390, '/products/smartfon-htc-desire-620g-dual-sim-matt-grey-orange-trim-30022333', 1),
(391, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-white-30022701', 1),
(392, '/products/smartfon-samsung-galaxy-s6-edge-128gb-sm-g925f-platinum-gold-30022130', 1),
(393, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-coral-30022874', 1),
(394, '/products/smartfon-htc-desire-620g-dual-sim-matt-grey-light-grey-trim-30022332', 1),
(395, '/products/smartfon-htc-desire-620g-dual-sim-gloss-white-light-grey-trim-30022331', 1),
(396, '/products/smartfon-htc-one-m9-eea-gunmetal-gray-30022376', 1),
(397, '/products/smartfon-samsung-galaxy-note-5-sm-n920-64gb-gold-30023757', 1),
(398, '/products/smartfon-lg-class-h650e-silver-30024150', 1),
(399, '/products/smartfon-samsung-galaxy-s6-edge-128gb-sm-g925f-black-sapphire-30022125', 1),
(400, '/products/smartfon-lenovo-vibe-p1m-white-30023831', 1),
(401, '/products/smartfon-sony-xperia-z5-e6653-white-30023597', 1),
(402, '/products/smartfon-sony-xperia-z3-lte-e6553-white-30022870', 1),
(403, '/products/smartfon-microsoft-lumia-640-ds-bright-orange-30022415', 1),
(404, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-white-pearl-30022124', 1),
(405, '/products/smartfon-htc-desire-526g-dualsim-stealth-black-30022384', 1),
(406, '/products/smartfon-asus-zenfone-selfie-zd551kl-32gb-white-1b130ru-30023486', 1),
(407, '/products/smartfon-huawei-shotx-ath-ul01-gold-30023971', 1),
(408, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-gold-30024594', 1),
(409, '/products/smartfon-sony-xperia-z5-premium-dual-e6883-black-30023849', 1),
(410, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-1i131ru-pink-30023781', 1),
(411, '/products/smartfon-sony-xperia-z3-d6603-white-30021019', 1),
(412, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-1k132ru-blue-30023782', 1),
(413, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-white-pearl-30022122', 1),
(414, '/products/smartfon-sony-xperia-z5-e6653-gold-30023598', 1),
(415, '/products/smartfon-sony-xperia-z3-lte-e6553-copper-30022871', 1),
(416, '/products/smartfon-htc-desire-816g-dual-sim-white-30022340', 1),
(417, '/products/smartfon-huawei-ascend-y6-black-scl-u31-30023925', 1),
(418, '/products/smartfon-huawei-ascend-y6-white-scl-u31-30023924', 1),
(419, '/products/smartfon-philips-s396-black-30023869', 1),
(420, '/products/smartfon-acer-liquid-z220-black-30022402', 1),
(421, '/products/smartfon-sony-xperia-z5-compact-e5823-coral-30023548', 1),
(422, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6j135ru-silver-30023785', 1),
(423, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6c133ru-red-30023783', 1),
(424, '/products/smartfon-lg-nexus-5x-16gb-white-30023930', 1),
(425, '/products/smartfon-lg-h324-leon-white-30024100', 1),
(426, '/products/smartfon-philips-s616-dark-grey-30024291', 1),
(427, '/products/smartfon-lg-nexus-5x-16gb-mint-30023929', 1),
(428, '/products/smartfon-asus-zenfone-selfie-zd551kl-16gb-6g128ru-gold-30024225', 1),
(429, '/products/smartfon-htc-one-a9-opal-silver-30024205', 1),
(430, '/products/smartfon-htc-one-a9-carbon-grey-30024204', 1),
(431, '/products/smartfon-htc-one-m9-gold-on-silver-30024206', 1),
(432, '/products/smartfon-htc-one-m9-gold-on-gold-30024198', 1),
(433, '/products/smartfon-sony-xperia-m4-aqua-dual-lte-e2333-black-30022698', 1),
(434, '/products/smartfon-huawei-ascend-y6-white-scl-l21-30023923', 1),
(435, '/products/smartfon-htc-desire-326g-dual-sim-white-birch-30023902', 1),
(436, '/products/smartfon-htc-desire-626g-dual-sim-white-30023732', 1),
(437, '/products/smartfon-philips-xenium-i908-black-30021086', 1),
(438, '/products/smartfon-philips-xenium-v526-navy-30023880', 1),
(439, '/products/smartfon-huawei-ascend-g7-silver-30021926', 1),
(440, '/products/smartfon-lenovo-vibe-shot-z90a40-white-30023798', 1),
(441, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-6j129ru-silver-30023780', 1),
(442, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-6c127ru-red-30023779', 1),
(443, '/products/smartfon-asus-zenfone-selfie-zd551kl-16gb-1i125ru-pink-30023777', 1),
(444, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-1b124ru-white-30023776', 1),
(445, '/products/smartfon-htc-desire-820g-dual-sim-white-30023904', 1),
(446, '/products/smartfon-sony-xperia-z5-compact-e5823-yellow-30023547', 1),
(447, '/products/smartfon-sony-xperia-z3-dual-d6633-white-30021040', 1),
(448, '/products/smartfon-huawei-honor-4c-black-30022341', 1),
(449, '/products/smartfon-samsung-galaxy-a5-sm-a500f-gold-30021706', 1),
(450, '/products/smartfon-yotaphone-2-black-yd201-30021990', 1),
(451, '/products/smartfon-samsung-galaxy-grand-prime-sm-g531h-gray-30022658', 1),
(452, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-platinum-gold-30022123', 1),
(453, '/products/smartfon-microsoft-lumia-640-ds-black-30022416', 1),
(454, '/products/smartfon-samsung-galaxy-a3-sm-a300f-gold-30021726', 1),
(455, '/products/smartfon-lg-k10-3g-k410-dark-blue-30024309', 1),
(456, '/products/smartfon-samsung-galaxy-a5-sm-a500f-white-30021628', 1),
(457, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-gold-30024249', 1),
(458, '/products/smartfon-huawei-honor-7-16gb-grey-plk-l01-30023365', 1),
(459, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-gold-30024244', 1),
(460, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-pink-gold-30024245', 1),
(461, '/products/smartfon-lenovo-a5000-black-30022329', 1),
(462, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-black-sapphire-30022041', 1),
(463, '/products/smartfon-lenovo-a1000-dual-sim-3g-white-30023852', 1),
(464, '/products/smartfon-huawei-honor-5x-grey-kiw-l21-30024277', 1),
(465, '/products/smartfon-alcatel-onetouch-pop-3-5015d-soft-silver-black-30023760', 1),
(466, '/products/smartfon-lenovo-a319-white-30021935', 1),
(467, '/products/smartfon-sony-xperia-z5-compact-e5823-white-30023545', 1),
(468, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-black-onyx-30024649', 1),
(469, '/products/smartfon-alcatel-onetouch-pop-3-5015d-soft-gold-black-30023761', 1),
(470, '/products/smartfon-samsung-galaxy-a3-2016-sm-a310-black-30024248', 1),
(471, '/products/smartfon-lg-g4s-h736-silver-30022659', 1),
(472, '/products/smartfon-samsung-galaxy-a3-sm-a300f-white-30021724', 1),
(473, '/products/smartfon-asus-zenfone-2-laser-ze500kg-1a067ru-black-30023786', 1),
(474, '/products/smartfon-htc-desire-626g-dual-sim-eea-blue-30022514', 1),
(475, '/products/smartfon-lenovo-a2010a-dual-sim-lte-white-30023434', 1),
(476, '/products/smartfon-sony-xperia-c4-e5303-black-30022699', 1),
(477, '/products/smartfon-sony-xperia-z5-e6653-graphite-black-30023596', 1),
(478, '/products/smartfon-samsung-galaxy-s7-32gb-ds-sm-g930fd-gold-platinum-30024651', 1),
(479, '/products/smartfon-lg-g4-h818-brown-leather-30022403', 1),
(480, '/products/smartfon-fly-era-nano-2-iq239-black-30023581', 1),
(481, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-black-sapphire-30022120', 1),
(482, '/products/smartfon-sony-xperia-z5-compact-e5823-black-30023546', 1),
(483, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1a047ru-black-30024227', 1),
(484, '/products/smartfon-alcatel-onetouch-pop-2-4045d-white-30022593', 1),
(485, '/products/smartfon-htc-desire-526g-dualsim-terra-white-and-glasser-blue-30022385', 1),
(486, '/products/smartfon-htc-one-m9-silver-gold-30022433', 1),
(487, '/products/smartfon-huawei-honor-7-silver-plk-l01-30023364', 1),
(488, '/products/smartfon-sony-xperia-z3-lte-e6553-black-30022872', 1),
(489, '/products/smartfon-huawei-ascend-y6-black-scl-l21-30023922', 1),
(490, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-black-30024212', 1),
(491, '/products/smartfon-texet-x-quad-tm-4503-30022728', 1),
(492, '/products/smartfon-texet-x-smart-tm-4071-black-30022722', 1),
(493, '/products/smartfon-philips-s309-black-30023437', 1),
(494, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-white-pearl-30022042', 1),
(495, '/products/smartfon-lg-l-fino-d295-black-30021928', 1),
(496, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-black-sapphire-30022127', 1),
(497, '/products/smartfon-samsung-galaxy-grand-prime-sm-g531h-white-30022657', 1),
(498, '/products/smartfon-lenovo-a536-black-30021192', 1),
(499, '/products/smartfon-samsung-galaxy-a3-sm-a300f-black-30021725', 1),
(500, '/products/smartfon-samsung-galaxy-ace-4-neo-sm-g318h-ds-black-30022656', 1),
(501, '/products/smartfon-microsoft-lumia-640-lte-ds-black-30022525', 1),
(502, '/products/smartfon-lenovo-a2010a-dual-sim-lte-black-30023433', 1),
(503, '/products/smartfon-lg-h422-spirit-30022457', 1),
(504, '/products/smartfon-microsoft-lumia-950-ds-black-30023992', 1),
(505, '/products/smartfon-prestigio-muze-a3-3452-duo-black-30022144', 1),
(506, '/products/smartfon-prestigio-wize-d3-3505-duo-30022743', 1),
(507, '/products/smartfon-lg-g3-stylus-d690-black-30021158', 1),
(508, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-black-30024246', 1),
(509, '/products/smartfon-lg-nexus-5x-16gb-black-30023858', 1),
(510, '/products/smartfon-lenovo-a5000-white-30022328', 1),
(511, '/products/smartfon-samsung-galaxy-ace-4-neo-sm-g318h-ds-white-30022655', 1),
(512, '/products/smartfon-prestigio-muze-c3-3504-duo-black-30023763', 1),
(513, '/products/smartfon-samsung-galaxy-a5-2016-sm-a510-white-30024247', 1),
(514, '/products/smartfon-lg-h324-leon-black-titan-30022458', 1),
(515, '/products/smartfon-samsung-galaxy-s6-ss-32gb-sm-g920f-gold-platinum-30022129', 1),
(516, '/products/smartfon-samsung-galaxy-core-2-ds-sm-g355-black-30020755', 1),
(517, '/products/smartfon-lenovo-vibe-shot-z90a40-grey-30022740', 1),
(518, '/products/smartfon-samsung-galaxy-s6-edge-plus-32gb-platinum-gold-30022910', 1),
(519, '/products/smartfon-lenovo-a536-white-30022425', 1),
(520, '/products/smartfon-lg-h502-magna-black-30022276', 1),
(521, '/products/smartfon-sony-xperia-z3-compact-d5803-white-30021014', 1),
(522, '/products/smartfon-samsung-galaxy-a5-sm-a500f-black-30021705', 1),
(523, '/products/smartfon-alcatel-onetouch-pop-star-3g-5022d-white-green-yellow-30023883', 1),
(524, '/products/smartfon-samsung-galaxy-s7-edge-32gb-ds-sm-g935fd-black-onyx-30024653', 1),
(525, '/products/smartfon-samsung-galaxy-s6-edge-64gb-sm-g925f-platinum-gold-30022128', 1),
(526, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1b048ru-white-30023790', 1),
(527, '/products/smartfon-lg-class-h650e-shiny-gold-30024066', 1),
(528, '/products/smartfon-samsung-galaxy-a7-2016-sm-a710-white-30024214', 1),
(529, '/products/smartfon-lg-ray-x190-silver-30023970', 1),
(530, '/products/smartfon-sony-xperia-m4-aqua-lte-e2303-black-30022702', 1),
(531, '/products/smartfon-lg-h324-leon-black-gold-30023765', 1),
(532, '/products/smartfon-lenovo-a1000-dual-sim-3g-black-30023814', 1),
(533, '/products/smartfon-samsung-galaxy-note-5-sm-n920-64gb-black-sapphire-30023758', 1),
(534, '/products/smartfon-fly-nimbus-1-black-fs451-30022797', 1),
(535, '/products/smartfon-texet-x-style-tm-4515-black-30022751', 1),
(536, '/products/smartfon-fly-stratus-1-black-fs401-30022796', 1),
(537, '/products/smartfon-htc-desire-816g-dual-sim-gray-30022338', 1),
(538, '/products/smartfon-philips-s307-black-yellow-30023868', 1),
(539, '/products/smartfon-sony-xperia-c5-ultra-dual-e5533-black-30023431', 1),
(540, '/products/smartfon-philips-s308-black-30020449', 1),
(541, '/products/smartfon-asus-zenfone-2-ze500kg-1c069ru-red-30023640', 1),
(542, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-black-30024335', 1),
(543, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-black-30024621', 1),
(544, '/products/smartfon-huawei-honor-5x-silver-kiw-l21-30024275', 1),
(545, '/products/smartfon-asus-zenfone-go-zc500tg-1c049ru-30024229', 1),
(546, '/products/smartfon-asus-zenfone-go-zc500tg-1b048ru-30024230', 1),
(547, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-16gb-1k126ru-blue-30023778', 1),
(548, '/products/smartfon-huawei-y5c-black-30022560', 1),
(549, '/products/smartfon-sony-xperia-z2-d6503-black-bez-garnitur-30020766', 1),
(550, '/products/smartfon-lenovo-p70-dark-blue-30022282', 1),
(551, '/products/smartfon-lg-g4c-h522y-silver-30022769', 1),
(552, '/products/smartfon-lenovo-a319-black-30021914', 1),
(553, '/products/smartfon-samsung-galaxy-s6-edge-32gb-sm-g925f-black-sapphire-30022043', 1),
(554, '/products/smartfon-samsung-galaxy-s6-edge-plus-32gb-black-sapphire-30022909', 1),
(555, '/products/smartfon-microsoft-lumia-550-black-30023993', 1),
(556, '/products/smartfon-texet-x-line-tm-5006-30022776', 1),
(557, '/products/smartfon-samsung-galaxy-s6-edge-special-ed-128gb-sm-g925f-green-30022623', 1),
(558, '/products/smartfon-alcatel-onetouch-pop-3-5015d-black-leather-30024177', 1),
(559, '/products/smartfon-texet-x-mega-tm-5503-30022778', 1),
(560, '/products/smartfon-asus-zenfone-2-laser-ze500kg-6j071ru-silver-30023787', 1),
(561, '/products/smartfon-fly-nimbus-4-black-fs551-30022799', 1),
(562, '/products/smartfon-asus-zenfone-2-selfie-zd551kl-32gb-6g134ru-gold-30023784', 1),
(563, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-white-30023987', 1),
(564, '/products/smartfon-sony-xperia-z3-compact-d5803-black-30021016', 1),
(565, '/products/smartfon-sony-xperia-z3-d6603-black-30021018', 1),
(566, '/products/smartfon-lenovo-vibe-z2-pro-k920-titanium-30021633', 1),
(567, '/products/smartfon-samsung-galaxy-j1-sm-j100f-black-30022696', 1),
(568, '/products/smartfon-samsung-galaxy-j1-sm-j100f-blue-30022697', 1),
(569, '/products/smartfon-asus-zenfone-go-zc500tg-1a047ru-30024231', 1),
(570, '/products/smartfon-lenovo-a319-red-30021760', 1),
(571, '/products/smartfon-texet-x-style-tm-4515-white-30022752', 1),
(572, '/products/smartfon-moto-x-style-lte-black-30024646', 1),
(573, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-white-30024623', 1),
(574, '/products/smartfon-4good-s450m-3g-black-30024345', 1),
(575, '/products/smartfon-4good-s501m-3g-black-30024344', 1),
(576, '/products/smartfon-alcatel-pop-star-3g-5022d-classy-white-gold-silver-30023884', 1),
(577, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-black-30024675', 1),
(578, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-pink-30024677', 1),
(579, '/products/smartfon-asus-zc451tg-zenfone-go-8gb-white-30024668', 1),
(580, '/products/smartfon-asus-zc550kl-zenfone-max-16gb-black-30024673', 1),
(581, '/products/smartfon-asus-zc550kl-zenfone-max-16gb-white-30024674', 1),
(582, '/products/smartfon-asus-ze601kl-zenfone-2-laser-32gb-gold-30024672', 1),
(583, '/products/smartfon-asus-ze601kl-zenfone-2-laser-32gb-red-30024671', 1),
(584, '/products/smartfon-asus-zenfone-2-laser-ze500kg-1b068ru-white-30024178', 1),
(585, '/products/smartfon-asus-zenfone-2-laser-ze550kl-1c049ru-red-30024228', 1),
(586, '/products/smartfon-asus-zenfone-2-laser-ze601kl-6j039ru-silver-30024343', 1),
(587, '/products/smartfon-asus-zx551ml-zenfone-2-zoom-128gb-black-30024669', 1),
(588, '/products/smartfon-fly-nimbus-3-white-fs501-30024615', 1),
(589, '/products/smartfon-htc-desire-326g-ds-black-onyx-30024199', 1),
(590, '/products/smartfon-htc-desire-620g-ds-gloss-white-blue-trim-30024220', 1),
(591, '/products/smartfon-htc-desire-728g-ds-purple-myst-30024207', 1),
(592, '/products/smartfon-htc-desire-728g-ds-white-luxury-30024203', 1),
(593, '/products/smartfon-htc-one-e9-dual-sim-delicate-rose-30023901', 1),
(594, '/products/smartfon-htc-one-e9-dual-sim-slick-silver-30023900', 1),
(595, '/products/smartfon-huawei-honor-7-premium-gold-plk-l01-30024678', 1),
(596, '/products/smartfon-huawei-nexus-6p-32gb-silver-30024152', 1),
(597, '/products/smartfon-huawei-shotx-ath-ul01-white-30023972', 1),
(598, '/products/smartfon-lenovo-a2010a-dual-sim-lte-red-30024333', 1),
(599, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-red-30024336', 1),
(600, '/products/smartfon-lenovo-a6010-dual-sim-8gb-lte-white-30024334', 1),
(601, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-dark-blue-30024383', 1),
(602, '/products/smartfon-lenovo-vibe-s1-dual-sim-lte-gold-30024384', 1),
(603, '/products/smartfon-lg-v10-black-30024280', 1),
(604, '/products/smartfon-moto-g-lte-black-30024641', 1),
(605, '/products/smartfon-moto-g-lte-white-30024642', 1),
(606, '/products/smartfon-moto-x-force-lte-black-30024643', 1),
(607, '/products/smartfon-moto-x-play-lte-black-30024644', 1),
(608, '/products/smartfon-moto-x-play-lte-white-30024645', 1),
(609, '/products/smartfon-philips-s309-8gb-1-black-30024771', 1),
(610, '/products/smartfon-prestigio-psp-3519-duo-yellow-30024379', 1),
(611, '/products/smartfon-samsung-galaxy-a3-sm-a300f-silver-30021727', 1),
(612, '/products/smartfon-samsung-galaxy-j-mini-sm-j105-gold-30024622', 1),
(613, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-black-30024596', 1),
(614, '/products/smartfon-samsung-galaxy-j3-sm-j320-black-30024751', 1),
(615, '/products/smartfon-samsung-galaxy-j3-sm-j320-gold-30024754', 1),
(616, '/products/smartfon-samsung-galaxy-j3-sm-j320-white-30024755', 1),
(617, '/products/smartfon-samsung-galaxy-note-5-sm-n920c-64gb-pink-30024308', 1),
(618, '/products/smartfon-texet-x-mini-2-tm-3500-30024337', 1),
(619, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-black-30021152', 1),
(620, '/products/smartfon-alcatel-onetouch-idol-3-6039y-4g-lte-dark-grey-30022464', 1),
(621, '/products/smartfon-samsung-galaxy-a7-sm-a700fd-black-30021804', 1),
(622, '/products/smartfon-asus-zenfone-5-a501cg-2c258rus-red-30020587', 1),
(623, '/products/smartfon-lg-g3-s-d724-white-30020699', 1),
(624, '/products/smartfon-asus-zenfone-4-a450cg-1d202ru-blue-30021090', 1),
(625, '/products/smartfon-sony-xperia-m5-e5603-black-30023430', 1),
(626, '/products/smartfon-sony-xperia-z1-c6903-purple-30018925', 1),
(627, '/products/smartfon-sony-xperia-e4-e2105-white-30021979', 1),
(628, '/products/smartfon-asus-zenfone-5-a502cg-2a065ru-black-30021922', 1),
(629, '/products/smartfon-sony-xperia-z3-compact-d5803-green-30021017', 1),
(630, '/products/smartfon-asus-zenfone-2-ze551ml-6a176ru-30022542', 1),
(631, '/products/smartfon-sony-xperia-z2-d6503-white-garnitura-30020032', 1),
(632, '/products/smartfon-sony-xperia-t2-ultra-dual-d5322-white-30019806', 1),
(633, '/products/smartfon-huawei-honor-3c-lite-black-30022435', 1),
(634, '/products/smartfon-huawei-ascend-y520-white-30022031', 1),
(635, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-pink-30021119', 1),
(636, '/products/smartfon-lenovo-a6000-black-30022325', 1),
(637, '/products/smartfon-sony-xperia-e4-e2105-black-30021978', 1),
(638, '/products/smartfon-asus-zenfone-4-a450cg-1b200ru-white-30021089', 1),
(639, '/products/smartfon-acer-liquid-jade-z-s57-white-30022391', 1),
(640, '/products/smartfon-sony-xperia-m2-d2303-white-30020117', 1),
(641, '/products/smartfon-fly-iq436i-era-nano-9-black-30021604', 1),
(642, '/products/smartfon-samsung-galaxy-s-iii-duos-gt-i9300i-white-30020383', 1),
(643, '/products/smartfon-huawei-honor-3c-lite-black-white-30022434', 1),
(644, '/products/smartfon-sony-xperia-e4g-dual-e2033-white-30022119', 1),
(645, '/products/smartfon-huawei-honor-g620s-black-30021971', 1),
(646, '/products/smartfon-asus-zenfone-4-a400cg-1e359rus-yellow-30021046', 1),
(647, '/products/smartfon-acer-liquid-z220-white-30022401', 1),
(648, '/products/smartfon-htc-desire-816g-dual-sim-matt-blue-30022339', 1),
(649, '/products/smartfon-htc-desire-820-darkgray-lightgray-30022334', 1),
(650, '/products/smartfon-asus-zenfone-2-ze551ml-6g179ru-30022490', 1),
(651, '/products/smartfon-asus-zenfone-4-a450cg-1e201ru-yellow-30021088', 1),
(652, '/products/smartfon-asus-zenfone-5-a502cg-2c067ru-red-30021924', 1),
(653, '/products/smartfon-htc-desire-820-darkgray-orange-30022335', 1),
(654, '/products/smartfon-htc-desire-820-white-gray-30022337', 1),
(655, '/products/smartfon-sony-xperia-z1-c6903-white-30018691', 1),
(656, '/products/smartfon-lenovo-a316i-black-30020090', 1),
(657, '/products/smartfon-samsung-galaxy-s3-ss-gt-i9301i-onyx-black-30021486', 1),
(658, '/products/smartfon-lenovo-s850-white-30020680', 1),
(659, '/products/smartfon-samsung-galaxy-s3-ss-gt-i9301i-ceramic-white-30021487', 1),
(660, '/products/smartfon-lg-l70-d325-dual-black-30019798', 1),
(661, '/products/smartfon-samsung-galaxy-core-prime-sm-g360-gray-30021665', 1),
(662, '/products/smartfon-lg-l90-d410-black-30020197', 1),
(663, '/products/smartfon-lenovo-a800-30017870', 1),
(664, '/products/smartfon-microsoft-lumia-535-ds-bright-green-30021500', 1),
(665, '/products/smartfon-samsung-galaxy-s-iii-duos-gt-i9300i-black-30020380', 1),
(666, '/products/smartfon-lenovo-s850-pink-30020669', 1),
(667, '/products/smartfon-asus-zenfone-2-ze551ml-6a147ru-30022541', 1),
(668, '/products/smartfon-samsung-galaxy-s6-duos-64gb-sm-g920fd-platinum-gold-30022121', 1),
(669, '/products/smartfon-nokia-lumia-930-black-30020748', 1),
(670, '/products/smartfon-huawei-honor-4s-gold-snm-u01-30024346', 1),
(671, '/products/smartfon-samsung-galaxy-a7-sm-a700fd-gold-30022157', 1),
(672, '/products/smartfon-sony-xperia-c3-d2533-black-30021036', 1),
(673, '/products/smartfon-acer-liquid-z520-hm-hlueu-002-30022600', 1),
(674, '/products/smartfon-asus-zenfone-5-a501cg-2a226rus-black-30020585', 1),
(675, '/products/smartfon-asus-padfone-s-pf500kl-white-30021855', 1),
(676, '/products/smartfon-ritmix-rmp-405-30020639', 1),
(677, '/products/smartfon-fly-iq4505-quad-era-life-7-black-30021607', 1),
(678, '/products/smartfon-lg-g3-s-d724-gold-30021954', 1),
(679, '/products/smartfon-huawei-honor-g620s-white-30021950', 1),
(680, '/products/smartfon-lg-l60-x145-white-30022151', 1),
(681, '/products/smartfon-asus-zenfone-2-ze551ml-6j177ru-30022466', 1),
(682, '/products/smartfon-samsung-galaxy-a5-sm-a500f-black-vnesh-akk-eb-pg900bbegr-30021816', 1),
(683, '/products/smartfon-texet-x-medium-tm-4572-black-30018734', 1),
(684, '/products/smartfon-sony-xperia-z1-c6903-black-30018690', 1),
(685, '/products/smartfon-keneksi-wind-black-30020611', 1),
(686, '/products/smartfon-lenovo-s850-blue-30020929', 1),
(687, '/products/smartfon-lenovo-a328-black-30021146', 1),
(688, '/products/smartfon-prestigio-multiphone-psp5453-duo-black-30020792', 1),
(689, '/products/smartfon-lg-g3-s-d724-titan-30020730', 1),
(690, '/products/smartfon-ritmix-rmp-471-30022369', 1),
(691, '/products/smartfon-microsoft-lumia-535-ds-bright-orange-30021501', 1),
(692, '/products/smartfon-keneksi-sun-black-30020613', 1),
(693, '/products/smartfon-lg-l70-d325-dual-white-30019797', 1),
(694, '/products/smartfon-prestigio-multiphone-psp5453-duo-metal-30022175', 1),
(695, '/products/smartfon-microsoft-lumia-430-bright-orange-30022273', 1),
(696, '/products/smartfon-texet-x4-tm-5082-blask-30022513', 1),
(697, '/products/smartfon-sony-xperia-z3-compact-d5803-orange-30021015', 1),
(698, '/products/smartfon-asus-zenfone-5-a501cg-2b257rus-white-30020586', 1),
(699, '/products/smartfon-lg-l60-x145-black-30021951', 1),
(700, '/products/smartfon-asus-zenfone-4-a400cg-1b360rus-white-30021047', 1),
(701, '/products/smartfon-lenovo-s90-32gb-gray-30021915', 1),
(702, '/products/smartfon-microsoft-lumia-430-black-30022274', 1),
(703, '/products/smartfon-htc-desire-820-white-blue-30022336', 1),
(704, '/products/smartfon-texet-tm-3521-x-alpha-black-30021503', 1),
(705, '/products/smartfon-texet-tm-5172-x-maxi-qhd-30020525', 1),
(706, '/products/smartfon-microsoft-lumia-535-ds-black-30022421', 1),
(707, '/products/smartfon-huawei-p8-lite-black-30022422', 1),
(708, '/products/smartfon-asus-zenfone-4-a400cg-1a356rus-black-30020589', 1),
(709, '/products/smartfon-samsung-galaxy-grand-prime-sm-g530h-white-30021735', 1),
(710, '/products/smartfon-lenovo-s60-graphite-grey-30022327', 1),
(711, '/products/smartfon-nokia-xl-ds-black-30020081', 1),
(712, '/products/smartfon-texet-x-basic-2-tm-4272-white-30020212', 1),
(713, '/products/smartfon-htc-desire-310-ss-blue-30020233', 1),
(714, '/products/smartfon-sony-xperia-m2-dual-d2302-black-30021326', 1),
(715, '/products/smartfon-htc-desire-310-ss-white-30020234', 1),
(716, '/products/smartfon-ritmix-rmp-470-black-30022437', 1),
(717, '/products/smartfon-explay-tornado-white-30021580', 1),
(718, '/products/smartfon-texet-x-basic-2-tm-4272-black-30020179', 1),
(719, '/products/smartfon-samsung-galaxy-star-advance-sm-g350e-white-30020520', 1),
(720, '/products/smartfon-lenovo-a369i-black-30022310', 1),
(721, '/products/smartfon-lg-g3-stylus-d690-white-30022150', 1),
(722, '/products/smartfon-fly-iq4490i-era-nano-10-black-30021606', 1),
(723, '/products/smartfon-samsung-galaxy-note-edge-32gb-sm-n915f-white-30021508', 1),
(724, '/products/smartfon-alcatel-one-touch-hero-8030y-30021457', 1),
(725, '/products/smartfon-fly-iq4490i-era-nano-10-white-30021579', 1),
(726, '/products/smartfon-asus-zenfone-4-a400cg-1c357rus-red-30021044', 1),
(727, '/products/smartfon-asus-zenfone-4-a400cg-1d358rus-blue-30021045', 1),
(728, '/products/smartfon-fly-iq436i-era-nano-9-white-30021605', 1),
(729, '/products/smartfon-fly-iq4416-era-life-5-black-30021600', 1),
(730, '/products/smartfon-fly-iq4504-quad-evo-energy-5-black-30021601', 1),
(731, '/products/smartfon-lenovo-a369i-white-30022311', 1),
(732, '/products/smartfon-lenovo-a369i-yellow-30022312', 1),
(733, '/products/smartfon-lg-nexus-5-d821-16gb-red-30021008', 1),
(734, '/products/smartfon-samsung-galaxy-note-4-sm-n910c-gold-30021150', 1),
(735, '/products/smartfon-sony-xperia-m2-aqua-d2403-black-30021325', 1),
(736, '/products/smartfon-sony-xperia-t3-d5103-black-30020682', 1),
(737, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531f-white-30024279', 1),
(738, '/products/smartfon-lg-x155-silver-titan-30023028', 1),
(739, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531f-gold-30024278', 1),
(740, '/products/smartfon-samsung-galaxy-s4-mini-ds-gt-i9192i-black-30023889', 1),
(741, '/products/smartfon-samsung-galaxy-grand-prime-lte-sm-g531-gray-30024292', 1),
(742, '/products/smartfon-samsung-galaxy-j1-2016-sm-j120-white-30024595', 1),
(743, '/products/televizor-lg-32lf562u-10007884', 1),
(744, '/products/televizor-lg-42lf562v-10007851', 1),
(745, '/products/televizor-sony-kdl43w756c-10008170', 1),
(746, '/products/televizor-samsung-ue55ju6790u-10007923', 1),
(747, '/products/televizor-samsung-ue48j6500au-10007917', 1),
(748, '/products/televizor-samsung-ultra-hd-ue55ju7500u-10007781', 1),
(749, '/products/televizor-lg-55lf653v-10007963', 1),
(750, '/products/televizor-samsung-ue55j6330au-10007939', 1),
(751, '/products/televizor-supra-stv-lc19t880wl-10009113', 1),
(752, '/products/televizor-sony-kdl40r453c-10008055', 1),
(753, '/products/televizor-lg-42lf550v-10008163', 1),
(754, '/products/televizor-samsung-ue55j6500au-10007918', 1),
(755, '/products/televizor-samsung-ue40s9au-10008599', 1),
(756, '/products/televizor-lg-49lf634v-10007975', 1),
(757, '/products/televizor-lg-65uf850v-10007960', 1),
(758, '/products/televizor-lg-40lf570v-10007852', 1),
(759, '/products/televizor-lg-32lf560u-10008160', 1),
(760, '/products/televizor-samsung-ultra-hd-ue78js9500t-10007815', 1),
(761, '/products/televizor-sony-kd75x9405c-10008288', 1),
(762, '/products/televizor-samsung-ue48j5510au-10007893', 1),
(763, '/products/televizor-sony-kd65x9305c-10008175', 1),
(764, '/products/televizor-samsung-ue32j4000ak-10008573', 1),
(765, '/products/televizor-samsung-ue55js8500t-10007925', 1),
(766, '/products/televizor-samsung-ue65ju6400u-10007849', 1),
(767, '/products/televizor-samsung-ue55ju7000u-10007769', 1),
(768, '/products/televizor-lg-ultra-hd-84ub980v-10006523', 1),
(769, '/products/televizor-lg-ultra-hd-79ub980v-10006524', 1),
(770, '/products/televizor-samsung-ue55js7200u-10008712', 1),
(771, '/products/televizor-lg-55ef950v-10008565', 1),
(772, '/products/televizor-sony-kdl65w855c-10008129', 1),
(773, '/products/televizor-lg-65ug870v-10008081', 1),
(774, '/products/televizor-samsung-ue65ju7500u-10007772', 1),
(775, '/products/televizor-philips-55pft6510-60-10009367', 1),
(776, '/products/televizor-supra-stv-lc40t882fl-10009224', 1),
(777, '/products/televizor-orion-olt-19100-10007068', 1),
(778, '/products/televizor-samsung-ue50js7200u-10008716', 1),
(779, '/products/televizor-akai-les-50v46m-10009141', 1),
(780, '/products/televizor-lg-32lf550u-10008139', 1),
(781, '/products/televizor-lg-65uf950v-10007961', 1),
(782, '/products/televizor-philips-ultra-hd-55pus9109-60-10007120', 1),
(783, '/products/televizor-samsung-ue65ju7000u-10007780', 1),
(784, '/products/televizor-samsung-ue85ju7000u-10008037', 1),
(785, '/products/televizor-samsung-ue78ju7500u-10008012', 1),
(786, '/products/televizor-samsung-ue75ju6400u-10007877', 1),
(787, '/products/televizor-samsung-ue32s9au-10008585', 1),
(788, '/products/televizor-samsung-ue48j5200au-10009097', 1),
(789, '/products/televizor-telefunken-tf-led32s32t2-10009329', 1),
(790, '/products/televizor-horizont-43le5173d-10009294', 1),
(791, '/products/televizor-samsung-ue60js7200u-10008718', 1),
(792, '/products/televizor-lg-49lf510v-10009402', 1),
(793, '/products/televizor-samsung-ue48j5000au-10009095', 1),
(794, '/products/televizor-samsung-ultra-hd-ue55hu8700t-10006649', 1),
(795, '/products/televizor-supra-stv-lc24t880wl-10009232', 1),
(796, '/products/televizor-samsung-ue65ju6000u-10008468', 1),
(797, '/products/televizor-samsung-ue55ju6600u-10007901', 1),
(798, '/products/televizor-supra-stv-lc24500wl-10008614', 1),
(799, '/products/televizor-supra-stv-lc55t950ul-10008755', 1),
(800, '/products/televizor-supra-stv-lc55st990ul00-10008756', 1),
(801, '/products/televizor-sony-kdl43w808c-10008192', 1),
(802, '/products/televizor-lg-55eg960v-10008297', 1),
(803, '/products/televizor-samsung-ue50ju6400u-10007841', 1),
(804, '/products/televizor-lg-42lb675v-10006071', 1),
(805, '/products/televizor-samsung-ue22h5610ak-10006402', 1),
(806, '/products/televizor-sony-kdl40r353c-10008482', 1),
(807, '/products/televizor-lg-32lf630v-10007854', 1),
(808, '/products/televizor-samsung-ue22h5600ak-10006422', 1),
(809, '/products/televizor-samsung-ultra-hd-ue105s9wat-10006894', 1),
(810, '/products/televizor-lg-42lf653v-10007861', 1),
(811, '/products/televizor-sony-kdl24w605a-white-10005116', 1),
(812, '/products/televizor-lg-40lf630v-10007853', 1),
(813, '/products/televizor-lg-43uf640v-10008442', 1),
(814, '/products/televizor-samsung-ue40j5510au-10007943', 1),
(815, '/products/televizor-lg-55lb675v-10006064', 1),
(816, '/products/televizor-samsung-ue32j6500au-10008042', 1),
(817, '/products/televizor-samsung-ue40j6200au-10007913', 1),
(818, '/products/televizor-lg-42lb677v-10006072', 1),
(819, '/products/televizor-samsung-ue40ju6790u-10007908', 1),
(820, '/products/televizor-sony-kdl50w805c-10008150', 1),
(821, '/products/televizor-lg-43lf630v-10007755', 1),
(822, '/products/televizor-philips-40pft4100-60-10007990', 1),
(823, '/products/televizor-philips-32pft4100-60-10007978', 1),
(824, '/products/televizor-samsung-ue40j6500au-10007941', 1),
(825, '/products/televizor-lg-32lf562v-10007859', 1),
(826, '/products/televizor-sony-kdl32w705c-10008001', 1),
(827, '/products/televizor-haier-le32b8000t-10008680', 1),
(828, '/products/televizor-philips-32pht4100-60-10008326', 1),
(829, '/products/televizor-samsung-ue48j5550au-10007894', 1),
(830, '/products/televizor-samsung-ue48j6330au-10007876', 1),
(831, '/products/televizor-sony-kdl55w808c-10008191', 1),
(832, '/products/televizor-lg-32lf620u-10007856', 1),
(833, '/products/televizor-samsung-ue48j6200au-10007848', 1),
(834, '/products/televizor-supra-stv-lc16741wl-10006440', 1),
(835, '/products/televizor-lg-49lf630v-10007937', 1),
(836, '/products/televizor-lg-22lf450u-10007872', 1),
(837, '/products/televizor-samsung-ue32j5500au-10007946', 1),
(838, '/products/televizor-haier-le24b8000t-10008332', 1),
(839, '/products/televizor-samsung-ue32j4100au-10007947', 1),
(840, '/products/televizor-lg-32lf560v-10008161', 1),
(841, '/products/televizor-samsung-ue40ju6600u-10007927', 1),
(842, '/products/televizor-lg-24lf450u-10007871', 1),
(843, '/products/televizor-samsung-ue28j4100ak-10007817', 1),
(844, '/products/televizor-samsung-ue48ju6790u-10007922', 1),
(845, '/products/televizor-lg-55ec930v-10006983', 1),
(846, '/products/televizor-lg-28lf450u-10007870', 1),
(847, '/products/televizor-samsung-ue40j5500au-10007944', 1),
(848, '/products/televizor-lg-55eg910v-10008564', 1),
(849, '/products/televizor-samsung-ue24h4070au-10006755', 1),
(850, '/products/televizor-lg-42lf580v-10007850', 1),
(851, '/products/televizor-samsung-ue48js9000t-10007802', 1),
(852, '/products/televizor-lg-55uf8537-10008471', 1),
(853, '/products/televizor-haier-le40b8000tf-10008333', 1),
(854, '/products/televizor-lg-49uf640v-10008788', 1),
(855, '/products/televizor-hisense-lhd32d50ts-10008662', 1),
(856, '/products/televizor-sony-kdl24w605a-black-10005115', 1),
(857, '/products/televizor-supra-stv-lc40t800fl-10008612', 1),
(858, '/products/televizor-lg-42lf620v-10007862', 1),
(859, '/products/televizor-samsung-ultra-hd-ue48ju7000u-10007768', 1),
(860, '/products/televizor-samsung-ue48j5500au-10007892', 1),
(861, '/products/televizor-sony-kdl48w705c-10008039', 1),
(862, '/products/televizor-samsung-ue48ju6600u-10007902', 1),
(863, '/products/televizor-samsung-ue48ju6610u-10007921', 1),
(864, '/products/televizor-orion-olt-16100-10007067', 1),
(865, '/products/televizor-samsung-ue32j5120ak-10007818', 1),
(866, '/products/televizor-lg-55lf630v-10007936', 1),
(867, '/products/televizor-samsung-ue48j5100au-10008330', 1),
(868, '/products/televizor-hisense-40k321uw-10008791', 1),
(869, '/products/televizor-samsung-ue55ju6400u-10008089', 1),
(870, '/products/televizor-samsung-ue40ju6610u-10007909', 1),
(871, '/products/televizor-samsung-ue48js8500t-10007919', 1),
(872, '/products/televizor-hisense-ltdn50k2204wteu-10008705', 1),
(873, '/products/televizor-supra-stv-lc40t880fl-10008862', 1),
(874, '/products/televizor-lg-32lf650v-10008162', 1),
(875, '/products/televizor-lg-42lf560v-10008164', 1),
(876, '/products/televizor-sony-kd55x9005c-10008355', 1),
(877, '/products/televizor-samsung-ultra-hd-ue55js9000t-10007800', 1),
(878, '/products/televizor-sony-kdl32r303c-10008483', 1),
(879, '/products/televizor-philips-24pht4000-60-10007952', 1),
(880, '/products/televizor-philips-65pft6520-60-10008815', 1),
(881, '/products/televizor-loewe-art-40-a52435o85-mocha-10005516', 1),
(882, '/products/televizor-supra-stv-lc32440wl-10005921', 1),
(883, '/products/televizor-sony-kdl40w705c-10008041', 1),
(884, '/products/televizor-samsung-ue40j6330au-10007928', 1),
(885, '/products/televizor-samsung-ue32j5200ak-10008393', 1),
(886, '/products/televizor-samsung-ue40ju7000u-10007874', 1),
(887, '/products/televizor-samsung-ue40j5550au-10007932', 1),
(888, '/products/televizor-samsung-ue40h5303ak-10006677', 1),
(889, '/products/televizor-haier-le32k5000t-10008104', 1),
(890, '/products/televizor-lg-32lf653v-10007855', 1),
(891, '/products/televizor-samsung-ue40j5120au-10007828', 1),
(892, '/products/televizor-samsung-ue40ju6530u-10008043', 1),
(893, '/products/televizor-lg-49uf8537-10008470', 1),
(894, '/products/televizor-samsung-ue22h5000ak-10006430', 1),
(895, '/products/televizor-samsung-ue32j6300au-10008630', 1),
(896, '/products/televizor-haier-le24b8000f-10008631', 1),
(897, '/products/televizor-samsung-ue48ju6530u-10007982', 1),
(898, '/products/televizor-lg-32lf580u-10007857', 1),
(899, '/products/televizor-haier-le48m7000cf-10008091', 1),
(900, '/products/televizor-lg-49lf640v-10008080', 1),
(901, '/products/televizor-hisense-ltdn40d50ts-10008663', 1),
(902, '/products/televizor-sony-kdl32r503c-10007809', 1),
(903, '/products/televizor-lg-32lf580v-10007858', 1),
(904, '/products/televizor-samsung-ue48ju6400u-10007840', 1),
(905, '/products/televizor-lg-42lf650v-10008165', 1),
(906, '/products/televizor-lg-43lf510v-10008744', 1),
(907, '/products/televizor-lg-32lf510u-10008371', 1),
(908, '/products/televizor-aiwa-24le7021-10007043', 1),
(909, '/products/televizor-samsung-ue40ju6400u-10007824', 1),
(910, '/products/televizor-samsung-ue40ju6000u-10008654', 1),
(911, '/products/televizor-sony-kd43x8305c-10008148', 1),
(912, '/products/televizor-samsung-ultra-hd-ue65js9000t-10007813', 1),
(913, '/products/televizor-philips-48pfs8209-60-10006788', 1),
(914, '/products/televizor-lg-55ug870v-10008363', 1),
(915, '/products/televizor-samsung-ue65js9500t-10007783', 1),
(916, '/products/televizor-lg-28lf498u-10008030', 1),
(917, '/products/televizor-supra-stv-lc32450wl-10009019', 1),
(918, '/products/televizor-supra-stv-lc22t880fl-10009205', 1),
(919, '/products/televizor-telefunken-tf-led24s21t2-10009331', 1),
(920, '/products/televizor-samsung-ue43ju6000u-10009020', 1),
(921, '/products/televizor-philips-24pht5619-60-10006493', 1),
(922, '/products/televizor-samsung-ue32j5550au-10007945', 1),
(923, '/products/televizor-sony-kdl40r553c-10007890', 1),
(924, '/products/televizor-haier-le40k5000tf-10008105', 1),
(925, '/products/televizor-sony-kdl43w807c-10008171', 1),
(926, '/products/televizor-supra-stv-lc16740wl-10006439', 1),
(927, '/products/televizor-philips-ultra-hd-55pus7909-60-10007066', 1),
(928, '/products/televizor-samsung-ue19h4000ak-10006500', 1),
(929, '/products/televizor-philips-22pft4000-60-10007935', 1),
(930, '/products/televizor-samsung-ue88js9500t-10008034', 1),
(931, '/products/televizor-supra-stv-lc32t880wl-10008844', 1),
(932, '/products/televizor-lg-49uf771v-10008885', 1),
(933, '/products/televizor-philips-48pft4100-60-10008480', 1),
(934, '/products/televizor-supra-stv-lc50t950ul-10008757', 1),
(935, '/products/televizor-supra-stv-lc32t882wl-10009233', 1),
(936, '/products/televizor-samsung-ue40j5200au-10009099', 1),
(937, '/products/televizor-supra-stv-lc42t910fl-10008783', 1),
(938, '/products/televizor-samsung-ue55ju6530u-10008040', 1),
(939, '/products/televizor-haier-le42b8000tf-10008880', 1),
(940, '/products/televizor-lg-55uf771v-10008884', 1),
(941, '/products/televizor-haier-le22m600f-10005229', 1),
(942, '/products/televizor-philips-ultra-hd-55pus8809-60-10006850', 1),
(943, '/products/televizor-haier-le32m600-10005241', 1),
(944, '/products/televizor-philips-40put6400-60-10008462', 1),
(945, '/products/televizor-aiwa-20le7011-10007041', 1),
(946, '/products/televizor-akai-lea-19v02s-10006955', 1),
(947, '/products/televizor-samsung-ue32j4500ak-10008695', 1),
(948, '/products/televizor-aiwa-32le7021-10008785', 1),
(949, '/products/televizor-samsung-ue24h4080au-10006954', 1),
(950, '/products/televizor-hisense-lhd32k2204wteu-10008704', 1),
(951, '/products/televizor-philips-24pht5210-60-10008463', 1),
(952, '/products/televizor-samsung-ue82s9wat-10008717', 1),
(953, '/products/televizor-orion-olt-22212-10008642', 1),
(954, '/products/oborudovanie-i-aksessuar-loewe-69474b00-10002045', 1),
(955, '/products/oborudovanie-i-aksessuar-loewe-71133081-10002164', 1),
(956, '/products/oborudovanie-i-aksessuar-loewe-cid-comfort-55-71632b00-10004198', 1),
(957, '/products/oborudovanie-i-aksessuar-loewe-equipment-board-floor-stand-cid-chrome-silver-10003124', 1),
(958, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-cid-silver-10003126', 1),
(959, '/products/oborudovanie-i-aksessuar-loewe-stand-cid-dynamic-chrome-silver-10003123', 1),
(960, '/products/televizor-akai-lea-32l34p-10009532', 1),
(961, '/products/televizor-akai-lea-50v35m-10009142', 1),
(962, '/products/televizor-akai-lea-55v36m-10009140', 1),
(963, '/products/televizor-hisense-55k321uw-10008790', 1),
(964, '/products/televizor-horizont-32le3181-10009295', 1),
(965, '/products/televizor-horizont-32le5161d-10009332', 1),
(966, '/products/televizor-horizont-49le5161d-10009296', 1),
(967, '/products/televizor-lg-55uf950v-10007899', 1),
(968, '/products/televizor-lg-65eg960v-10008434', 1),
(969, '/products/televizor-lg-70uf771v-10008586', 1),
(970, '/products/televizor-loewe-art-40-52435u85-white-10005517', 1),
(971, '/products/televizor-loewe-art-40-uhd-54457w80-black-10008671', 1),
(972, '/products/televizor-loewe-connect-32-54446w85-black-black-10009003', 1),
(973, '/products/televizor-loewe-connect-id-40-52463v85-beige-black-10007196', 1),
(974, '/products/televizor-loewe-one-55-55402u70-white-10009112', 1),
(975, '/products/televizor-orion-olt-24112-10007058', 1),
(976, '/products/televizor-orion-olt-32202-10008640', 1),
(977, '/products/televizor-orion-olt-32302-10009652', 1),
(978, '/products/televizor-orion-olt-40000-10009653', 1),
(979, '/products/televizor-philips-48pus7600-60-10008641', 1),
(980, '/products/televizor-philips-49pus7100-60-10009365', 1),
(981, '/products/televizor-philips-49pus7150-60-10009366', 1),
(982, '/products/televizor-philips-50put6400-60-10009369', 1),
(983, '/products/televizor-philips-55pft6300-60-10008135', 1),
(984, '/products/televizor-philips-55put6400-60-10009368', 1),
(985, '/products/televizor-samsung-ue40j5000au-10009098', 1),
(986, '/products/televizor-samsung-ue48ju6000u-10008481', 1),
(987, '/products/televizor-samsung-ue50j5500au-10007948', 1),
(988, '/products/televizor-samsung-ue55j5500au-10007981', 1),
(989, '/products/televizor-samsung-ue55j6390au-10007970', 1),
(990, '/products/televizor-samsung-ue55ju6000u-10008467', 1),
(991, '/products/televizor-samsung-ue65js8500t-10008050', 1),
(992, '/products/televizor-samsung-ue65ju6800u-10008571', 1),
(993, '/products/televizor-sony-kd55x9305c-10008183', 1),
(994, '/products/televizor-sony-kd65x9005c-10008353', 1),
(995, '/products/televizor-telefunken-tf-led28s12-10009345', 1),
(996, '/products/televizor-telefunken-tf-led32s21t2-10009328', 1),
(997, '/products/televizor-philips-48pft6300-60-10008134', 1),
(998, '/products/televizor-supra-stv-lc32t871wl-10007061', 1),
(999, '/products/televizor-lg-28lf491u-10008031', 1),
(1000, '/products/televizor-samsung-ue48j6390au-10007916', 1),
(1001, '/products/televizor-samsung-ue40ju6490u-10007940', 1),
(1002, '/products/televizor-lg-98ub980v-10007524', 1),
(1003, '/products/televizor-sony-ultra-hd-kd65s9005b-10007035', 1),
(1004, '/products/televizor-samsung-ue75ju7000u-10007912', 1),
(1005, '/products/televizor-sony-kdl60w605b-10006549', 1),
(1006, '/products/televizor-loewe-art-40-52435t85-chrome-silver-10005444', 1),
(1007, '/products/televizor-loewe-art-40-52435w85-black-10005339', 1),
(1008, '/products/akusticheskaya-sistema-loewe-51205b00-silver-10002640', 1),
(1009, '/products/televizor-lg-105uc9v-10007767', 1),
(1010, '/products/televizor-panasonic-smart-viera-tx-pr65vt60-10004751', 1),
(1011, '/products/televizor-lg-ultra-hd-49ub820v-10006637', 1),
(1012, '/products/televizor-lg-42lb671v-10006336', 1),
(1013, '/products/televizor-samsung-ultrahd-ue55hu9000t-10006132', 1),
(1014, '/products/televizor-samsung-ue40j6390au-10007942', 1),
(1015, '/products/televizor-lg-42ub828v-10007860', 1),
(1016, '/products/televizor-philips-48pfs8159-60-10007410', 1),
(1017, '/products/televizor-haier-le40m600f-10006476', 1),
(1018, '/products/televizor-samsung-ue32-eh5300w-10002921', 1),
(1019, '/products/televizor-aiwa-24le7020-10007042', 1),
(1020, '/products/televizor-loewe-art-60-52437w85-black-10005440', 1),
(1021, '/products/televizor-philips-ultra-hd-65pus9809-60-10007407', 1),
(1022, '/products/televizor-lg-ultra-hd-42ub820v-10006730', 1),
(1023, '/products/televizor-lg-49ub828v-10008118', 1),
(1024, '/products/televizor-philips-48pfs8109-60-10006787', 1),
(1025, '/products/televizor-philips-ultra-hd-49pus7809-60-10006386', 1),
(1026, '/products/televizor-philips-55pft6569-60-10006418', 1),
(1027, '/products/televizor-lg-47lb720v-10006139', 1),
(1028, '/products/televizor-haier-le32f6000t-10007774', 1),
(1029, '/products/televizor-lg-32-cs560-10002549', 1),
(1030, '/products/televizor-lg-55ub828v-10008117', 1),
(1031, '/products/televizor-haier-le28f6000t-10007773', 1),
(1032, '/products/televizor-lg-49uf850v-10008082', 1),
(1033, '/products/televizor-samsung-ue48ju6490u-10007920', 1),
(1034, '/products/televizor-samsung-le-32-e420m2w-10002480', 1),
(1035, '/products/televizor-philips-ultrahd-55pus7809-60-10006417', 1),
(1036, '/products/televizor-philips-47pft5209-60-10006653', 1),
(1037, '/products/televizor-philips-40pft6300-60-10008133', 1),
(1038, '/products/televizor-bbk-led2278f-10005209', 1),
(1039, '/products/televizor-supra-stv-lc19t860wl-10007762', 1),
(1040, '/products/televizor-aiwa-20le7010-10007040', 1),
(1041, '/products/televizor-lg-55uf853v-10008136', 1),
(1042, '/products/televizor-loewe-individual-55-52403p43-alu-titan-10005214', 1),
(1043, '/products/akusticheskaya-sistema-loewe-66201l00-black-10002776', 1),
(1044, '/products/akusticheskaya-sistema-loewe-compact-50212w00-bl-10002260', 1),
(1045, '/products/akusticheskaya-sistema-loewe-individual-stand-speaker-sl-69204u10-white-10007885', 1),
(1046, '/products/akusticheskaya-sistema-loewe-sound-projector-individual-sl-69205u80-white-10005397', 1),
(1047, '/products/akusticheskaya-sistema-loewe-speaker-2go-52231l00-black-10005392', 1),
(1048, '/products/akusticheskaya-sistema-loewe-stereo-speaker-i40-52205u00-white-10005385', 1),
(1049, '/products/akusticheskaya-sistema-loewe-stereo-speaker-i55-52207p00-titan-10005396', 1),
(1050, '/products/akusticheskaya-sistema-loewe-subwoofer-525-art-no-69211u30-white-10005387', 1),
(1051, '/products/video-tehnika-loewe-blutech-vision-3d-53504l02-black-10005398', 1),
(1052, '/products/video-tehnika-loewe-blutech-vision-3d-53504t02-chrome-silver-10005399', 1),
(1053, '/products/oborudovanie-i-aksessuar-loewe-51495q00-10002044', 1),
(1054, '/products/oborudovanie-i-aksessuar-loewe-70994q00-10002046', 1),
(1055, '/products/oborudovanie-i-aksessuar-loewe-70996b00-10002047', 1),
(1056, '/products/oborudovanie-i-aksessuar-loewe-70997b00-10002048', 1),
(1057, '/products/oborudovanie-i-aksessuar-loewe-89644b10-silver-10002249', 1),
(1058, '/products/oborudovanie-i-aksessuar-loewe-active-glasses-3d-71133082-black-10005579', 1),
(1059, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-reference-55-mu-72203b00-alu-silver-10008588', 1),
(1060, '/products/oborudovanie-i-aksessuar-loewe-floor-stand-universal-32-55-72190b00-alu-silver-10007888', 1),
(1061, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-floor-i-40-55-71524b00-10005351', 1),
(1062, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-floor-i-40-55-mu-sp-71782b00-10005355', 1),
(1063, '/products/oborudovanie-i-aksessuar-loewe-rotation-unit-table-i-40-55-71510b00-10005356', 1),
(1064, '/products/oborudovanie-i-aksessuar-loewe-screen-floor-cross-i-40-46-71520q00-10005352', 1),
(1065, '/products/oborudovanie-i-aksessuar-loewe-screen-floor-plate-i-46-55-71523b00-chrome-10007887', 1),
(1066, '/products/oborudovanie-i-aksessuar-loewe-screen-table-plate-i-40-71671b00-10005357', 1),
(1067, '/products/oborudovanie-i-aksessuar-loewe-table-stand-cid-comfort-10003127', 1),
(1068, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-3d-orchestra-speaker-71775001-10005389', 1),
(1069, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-isoflex-32-55-71363b00-10005371', 1),
(1070, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-slim-vesa-size-400-71361t20-chrome-10007886', 1),
(1071, '/products/oborudovanie-i-aksessuar-loewe-wall-mount-wm-67-72115w80-black-10008589', 1),
(1072, '/products/televizor-loewe-art-32-52434o85-mocha-10007810', 1),
(1073, '/products/televizor-loewe-art-32-52434u85-white-10007779', 1),
(1074, '/products/televizor-loewe-art-48-54458t80-chrome-silver-10008590', 1),
(1075, '/products/televizor-loewe-art-48-54458w80-black-10008331', 1),
(1076, '/products/televizor-loewe-art-50-52436u85-white-10005515', 1),
(1077, '/products/televizor-loewe-art-55-54459w80-black-10007895', 1),
(1078, '/products/televizor-loewe-connect-22-50405u80-white-10002330', 1),
(1079, '/products/televizor-loewe-connect-22-50405w80-black-10002066', 1),
(1080, '/products/televizor-loewe-connect-40-51409u82-white-10002345', 1),
(1081, '/products/televizor-loewe-connect-40-51409w82-black-10002346', 1),
(1082, '/products/televizor-loewe-connect-id-32-51462w64-black-black-10005151', 1),
(1083, '/products/televizor-loewe-connect-id-40-51463w84-black-black-10004408', 1),
(1084, '/products/televizor-loewe-connect-id-40-51463y84-white-black-hgl-10003113', 1),
(1085, '/products/televizor-loewe-connect-id-46-51464v84-beige-black-hgl-10003122', 1),
(1086, '/products/televizor-loewe-connect-id-46-51464y84-white-black-hgl-10003119', 1),
(1087, '/products/televizor-loewe-connect-id-55-51465z84-black-white-10004197', 1),
(1088, '/products/televizor-loewe-connect-id-55-dr-54443o50-cappuccino-black-10007442', 1),
(1089, '/products/televizor-loewe-individual-40-52401u43-white-10005200', 1),
(1090, '/products/televizor-loewe-individual-46-52402u43-white-10005204', 1),
(1091, '/products/televizor-loewe-reference-55-54433b40-alu-silver-10008559', 1),
(1092, '/products/televizor-philips-55pus7100-60-10008644', 1),
(1093, '/products/televizor-philips-55pus7150-60-10008674', 1),
(1094, '/products/televizor-samsung-ue55j6200au-10007938', 1),
(1095, '/products/televizor-sony-kd75x8505c-10008237', 1),
(1096, '/products/televizor-philips-50pft5300-60-10008833', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `list_parser`
--

CREATE TABLE `list_parser` (
  `id` int(11) NOT NULL,
  `value` varchar(145) DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `list_parser`
--

INSERT INTO `list_parser` (`id`, `value`, `id_source`) VALUES
(17, 'Смартфоны', 7),
(19, 'Смарт-часы', 6),
(21, 'Смарт-часы', 8),
(22, 'Бытовая техника', 9),
(23, 'Бытовая техника', 10),
(24, 'Смартфоны', 10),
(29, 'Компьютеры', 10),
(30, 'Игровые приставки', 10),
(31, 'Телевизор', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Структура таблицы `prop_parser`
--

CREATE TABLE `prop_parser` (
  `id` int(11) NOT NULL,
  `id_parser` int(11) DEFAULT NULL,
  `value` text,
  `name_property` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prop_parser`
--

INSERT INTO `prop_parser` (`id`, `id_parser`, `value`, `name_property`) VALUES
(14, 23, 'site_url', 'url'),
(15, 23, 'item', 'class_item'),
(16, 23, 'page', 'next_link'),
(17, 23, 'h1', 'name_item'),
(18, 23, 'code', 'code_item'),
(19, 23, 'exec', 'exceptions'),
(20, 23, 'templates', 'link_reviews'),
(21, 23, 'sadasd', 'class_review'),
(22, 29, '', 'url'),
(23, 29, '', 'class_item'),
(24, 29, '', 'next_link'),
(25, 29, '', 'name_item'),
(26, 29, 'hz', 'code_item'),
(27, 29, '', 'exceptions'),
(28, 29, '', 'link_reviews'),
(29, 29, '', 'class_review');

-- --------------------------------------------------------

--
-- Структура таблицы `source_pars`
--

CREATE TABLE `source_pars` (
  `id` int(11) NOT NULL,
  `value` varchar(145) NOT NULL,
  `tr_name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `source_pars`
--

INSERT INTO `source_pars` (`id`, `value`, `tr_name`) VALUES
(3, 'Эльдорадо', 'Eldorado'),
(6, 'DNS', 'DNS'),
(8, 'М-видео', 'M-video'),
(9, 'Техношое', 'Tehnoshoe'),
(10, 'Техношок', 'Tehnoshok');

-- --------------------------------------------------------

--
-- Структура таблицы `table_test`
--

CREATE TABLE `table_test` (
  `id` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `surname` varchar(145) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `table_test`
--

INSERT INTO `table_test` (`id`, `name`, `surname`) VALUES
(1, 'ciel', 'phantomhive');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1461443251, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '127.0.0.1', NULL, '$2y$08$x/AV.GDKCM6F1FoDSdTs/OqBXdQ4cX.QhaV9fEXCpg5YLyI39UgYe', NULL, 'alex453542026@yandex.ru', NULL, NULL, NULL, NULL, 1458722044, 1458737244, 1, 'ciel', 'phantomhive', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(6, 2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `default_property`
--
ALTER TABLE `default_property`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `source_pars`
--
ALTER TABLE `source_pars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `table_test`
--
ALTER TABLE `table_test`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `default_property`
--
ALTER TABLE `default_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `prop_parser`
--
ALTER TABLE `prop_parser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `source_pars`
--
ALTER TABLE `source_pars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `table_test`
--
ALTER TABLE `table_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
