-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db_server
-- Erstellungszeit: 16. Jun 2026 um 10:43
-- Server-Version: 9.4.0
-- PHP-Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mcbuildhelper`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blockpalettes`
--

CREATE TABLE `blockpalettes` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `creator` int NOT NULL,
  `block1` int DEFAULT '487',
  `block2` int DEFAULT '487',
  `block3` int DEFAULT '487',
  `block4` int DEFAULT '487',
  `block5` int DEFAULT '487',
  `block6` int DEFAULT '487'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `blockpalettes`
--

INSERT INTO `blockpalettes` (`id`, `name`, `creator`, `block1`, `block2`, `block3`, `block4`, `block5`, `block6`) VALUES
(1, 'stone gradient', 4, 121, 169, 168, 489, 110, 9),
(6, 'Hobbit Höhle', 3, 85, 510, 486, 82, 489, 178),
(7, 'savannah hut', 3, 14, 544, 15, 543, 4, 5),
(9, 'red', 2, 422, 438, 212, 435, 429, 426),
(12, 'Zaubershop', 3, 544, 407, 394, 510, 409, 225),
(14, 'old ruin', 9, 320, 319, 109, 233, 169, 485),
(15, 'Blue', 9, 280, 277, 275, 274, 276, 149);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blocks`
--

CREATE TABLE `blocks` (
  `id` int NOT NULL,
  `mcId` int DEFAULT NULL,
  `path` varchar(1000) NOT NULL,
  `name` varchar(50) NOT NULL,
  `avgColorHex` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `blocks`
--

INSERT INTO `blocks` (`id`, `mcId`, `path`, `name`, `avgColorHex`) VALUES
(1, NULL, './server/media/blocks/acacia_leaves.png', 'acacia leaves', '#565656'),
(2, NULL, './server/media/blocks/acacia_log.png', 'acacia log', '#676157'),
(3, NULL, './server/media/blocks/acacia_log_top.png', 'acacia log top', '#975937'),
(4, NULL, './server/media/blocks/acacia_planks.png', 'acacia planks', '#a85a32'),
(5, NULL, './server/media/blocks/acacia_trapdoor.png', 'acacia trapdoor', '#784327'),
(6, NULL, './server/media/blocks/amethyst_block.png', 'amethyst block', '#8662bf'),
(7, NULL, './server/media/blocks/ancient_debris_side.png', 'ancient debris side', '#604038'),
(8, NULL, './server/media/blocks/ancient_debris_top.png', 'ancient debris top', '#5f433b'),
(9, NULL, './server/media/blocks/andesite.png', 'andesite', '#888889'),
(10, NULL, './server/media/blocks/azalea_leaves.png', 'azalea leaves', '#455922'),
(11, NULL, './server/media/blocks/azalea_top.png', 'azalea top', '#667d30'),
(12, NULL, './server/media/blocks/bamboo_block.png', 'bamboo block', '#7f903a'),
(13, NULL, './server/media/blocks/bamboo_block_top.png', 'bamboo block top', '#8b8e3f'),
(14, NULL, './server/media/blocks/bamboo_mosaic.png', 'bamboo mosaic', '#beaa4e'),
(15, NULL, './server/media/blocks/bamboo_planks.png', 'bamboo planks', '#c1ad51'),
(16, NULL, './server/media/blocks/bamboo_trapdoor.png', 'bamboo trapdoor', '#a59547'),
(17, NULL, './server/media/blocks/barrel_bottom.png', 'barrel bottom', '#745531'),
(18, NULL, './server/media/blocks/barrel_side.png', 'barrel side', '#6c5132'),
(19, NULL, './server/media/blocks/barrel_top.png', 'barrel top', '#86653b'),
(20, NULL, './server/media/blocks/basalt_side.png', 'basalt side', '#49494e'),
(21, NULL, './server/media/blocks/basalt_top.png', 'basalt top', '#515156'),
(22, NULL, './server/media/blocks/beacon.png', 'beacon', '#76ddd7'),
(23, NULL, './server/media/blocks/bedrock.png', 'bedrock', '#555555'),
(24, NULL, './server/media/blocks/beehive_end.png', 'beehive end', '#b5925a'),
(25, NULL, './server/media/blocks/beehive_front.png', 'beehive front', '#9f804e'),
(26, NULL, './server/media/blocks/beehive_front_honey.png', 'beehive front honey', '#a7844a'),
(27, NULL, './server/media/blocks/beehive_side.png', 'beehive side', '#9d7f4c'),
(28, NULL, './server/media/blocks/bee_nest_bottom.png', 'bee nest bottom', '#a17f58'),
(29, NULL, './server/media/blocks/bee_nest_front.png', 'bee nest front', '#b78e4c'),
(30, NULL, './server/media/blocks/bee_nest_front_honey.png', 'bee nest front honey', '#c3984c'),
(31, NULL, './server/media/blocks/bee_nest_side.png', 'bee nest side', '#c4974d'),
(32, NULL, './server/media/blocks/bee_nest_top.png', 'bee nest top', '#caa04b'),
(33, NULL, './server/media/blocks/birch_leaves.png', 'birch leaves', '#4a4949'),
(34, NULL, './server/media/blocks/birch_log.png', 'birch log', '#d9d7d2'),
(35, NULL, './server/media/blocks/birch_log_top.png', 'birch log top', '#c1b387'),
(36, NULL, './server/media/blocks/birch_planks.png', 'birch planks', '#c0af79'),
(37, NULL, './server/media/blocks/birch_trapdoor.png', 'birch trapdoor', '#cfc29d'),
(38, NULL, './server/media/blocks/blackstone.png', 'blackstone', '#2a2329'),
(39, NULL, './server/media/blocks/blackstone_top.png', 'blackstone top', '#2b242a'),
(40, NULL, './server/media/blocks/black_concrete.png', 'black concrete', '#090b10'),
(41, NULL, './server/media/blocks/black_concrete_powder.png', 'black concrete powder', '#191b20'),
(42, NULL, './server/media/blocks/black_glazed_terracotta.png', 'black glazed terracotta', '#441e20'),
(43, NULL, './server/media/blocks/black_shulker_box.png', 'black shulker box', '#19191d'),
(44, NULL, './server/media/blocks/black_stained_glass.png', 'black stained glass', '#191919'),
(45, NULL, './server/media/blocks/black_terracotta.png', 'black terracotta', '#251710'),
(46, NULL, './server/media/blocks/black_wool.png', 'black wool', '#15151a'),
(47, NULL, './server/media/blocks/blast_furnace_front.png', 'blast furnace front', '#6c6c6b'),
(48, NULL, './server/media/blocks/blast_furnace_side.png', 'blast furnace side', '#6c6c6c'),
(49, NULL, './server/media/blocks/blast_furnace_top.png', 'blast furnace top', '#515051'),
(50, NULL, './server/media/blocks/blue_concrete.png', 'blue concrete', '#2d2f8f'),
(51, NULL, './server/media/blocks/blue_concrete_powder.png', 'blue concrete powder', '#4649a7'),
(52, NULL, './server/media/blocks/blue_glazed_terracotta.png', 'blue glazed terracotta', '#30418b'),
(53, NULL, './server/media/blocks/blue_ice.png', 'blue ice', '#74a8fd'),
(54, NULL, './server/media/blocks/blue_shulker_box.png', 'blue shulker box', '#2c2e8c'),
(55, NULL, './server/media/blocks/blue_stained_glass.png', 'blue stained glass', '#334cb2'),
(56, NULL, './server/media/blocks/blue_terracotta.png', 'blue terracotta', '#4b3c5b'),
(57, NULL, './server/media/blocks/blue_wool.png', 'blue wool', '#35399e'),
(58, NULL, './server/media/blocks/bone_block_side.png', 'bone block side', '#e6e2d0'),
(59, NULL, './server/media/blocks/bone_block_top.png', 'bone block top', '#d2ceb4'),
(60, NULL, './server/media/blocks/bookshelf.png', 'bookshelf', '#765f3c'),
(61, NULL, './server/media/blocks/brain_coral_block.png', 'brain coral block', '#d05ba0'),
(62, NULL, './server/media/blocks/bricks.png', 'bricks', '#976253'),
(63, NULL, './server/media/blocks/brown_concrete.png', 'brown concrete', '#603c20'),
(64, NULL, './server/media/blocks/brown_concrete_powder.png', 'brown concrete powder', '#7e5536'),
(65, NULL, './server/media/blocks/brown_glazed_terracotta.png', 'brown glazed terracotta', '#786a56'),
(66, NULL, './server/media/blocks/brown_mushroom_block.png', 'brown mushroom block', '#957051'),
(67, NULL, './server/media/blocks/brown_shulker_box.png', 'brown shulker box', '#6a4224'),
(68, NULL, './server/media/blocks/brown_stained_glass.png', 'brown stained glass', '#664c33'),
(69, NULL, './server/media/blocks/brown_terracotta.png', 'brown terracotta', '#4d3324'),
(70, NULL, './server/media/blocks/brown_wool.png', 'brown wool', '#724829'),
(71, NULL, './server/media/blocks/bubble_coral_block.png', 'bubble coral block', '#a51aa2'),
(72, NULL, './server/media/blocks/budding_amethyst.png', 'budding amethyst', '#8560bb'),
(73, NULL, './server/media/blocks/cactus_bottom.png', 'cactus bottom', '#6e8242'),
(74, NULL, './server/media/blocks/cactus_side.png', 'cactus side', '#4f7428'),
(75, NULL, './server/media/blocks/cactus_top.png', 'cactus top', '#426121'),
(76, NULL, './server/media/blocks/calcite.png', 'calcite', '#e0e0dd'),
(77, NULL, './server/media/blocks/cartography_table_side1.png', 'cartography table side1', '#473222'),
(78, NULL, './server/media/blocks/cartography_table_side2.png', 'cartography table side2', '#523e2a'),
(79, NULL, './server/media/blocks/cartography_table_side3.png', 'cartography table side3', '#442c14'),
(80, NULL, './server/media/blocks/cartography_table_top.png', 'cartography table top', '#685843'),
(81, NULL, './server/media/blocks/carved_pumpkin.png', 'carved pumpkin', '#965411'),
(82, NULL, './server/media/blocks/cherry_leaves.png', 'cherry leaves', '#c292a4'),
(83, NULL, './server/media/blocks/cherry_log.png', 'cherry log', '#37212d'),
(84, NULL, './server/media/blocks/cherry_log_top.png', 'cherry log top', '#b98d89'),
(85, NULL, './server/media/blocks/cherry_planks.png', 'cherry planks', '#e3b3ad'),
(86, NULL, './server/media/blocks/cherry_trapdoor.png', 'cherry trapdoor', '#c39994'),
(87, NULL, './server/media/blocks/chiseled_bookshelf_empty.png', 'chiseled bookshelf empty', '#5a472a'),
(88, NULL, './server/media/blocks/chiseled_bookshelf_occupied.png', 'chiseled bookshelf occupied', '#795e46'),
(89, NULL, './server/media/blocks/chiseled_bookshelf_side.png', 'chiseled bookshelf side', '#af8e57'),
(90, NULL, './server/media/blocks/chiseled_bookshelf_top.png', 'chiseled bookshelf top', '#b29159'),
(91, NULL, './server/media/blocks/chiseled_copper.png', 'chiseled copper', '#b8654a'),
(92, NULL, './server/media/blocks/chiseled_deepslate.png', 'chiseled deepslate', '#363637'),
(93, NULL, './server/media/blocks/chiseled_nether_bricks.png', 'chiseled nether bricks', '#2e171b'),
(94, NULL, './server/media/blocks/chiseled_polished_blackstone.png', 'chiseled polished blackstone', '#363139'),
(95, NULL, './server/media/blocks/chiseled_quartz_block.png', 'chiseled quartz block', '#e8e3da'),
(96, NULL, './server/media/blocks/chiseled_quartz_block_top.png', 'chiseled quartz block top', '#e8e3d9'),
(97, NULL, './server/media/blocks/chiseled_red_sandstone.png', 'chiseled red sandstone', '#b7611c'),
(98, NULL, './server/media/blocks/chiseled_resin_bricks.png', 'chiseled resin bricks', '#c95419'),
(99, NULL, './server/media/blocks/chiseled_sandstone.png', 'chiseled sandstone', '#d8cb9b'),
(100, NULL, './server/media/blocks/chiseled_stone_bricks.png', 'chiseled stone bricks', '#787778'),
(101, NULL, './server/media/blocks/chiseled_tuff.png', 'chiseled tuff', '#595e57'),
(102, NULL, './server/media/blocks/chiseled_tuff_bricks.png', 'chiseled tuff bricks', '#636760'),
(103, NULL, './server/media/blocks/chiseled_tuff_bricks_top.png', 'chiseled tuff bricks top', '#6f726b'),
(104, NULL, './server/media/blocks/chiseled_tuff_top.png', 'chiseled tuff top', '#5e635b'),
(105, NULL, './server/media/blocks/clay.png', 'clay', '#a1a7b3'),
(106, NULL, './server/media/blocks/coal_block.png', 'coal block', '#101010'),
(107, NULL, './server/media/blocks/coal_ore.png', 'coal ore', '#6a6a69'),
(108, NULL, './server/media/blocks/coarse_dirt.png', 'coarse dirt', '#78563b'),
(109, NULL, './server/media/blocks/cobbled_deepslate.png', 'cobbled deepslate', '#4d4d51'),
(110, NULL, './server/media/blocks/cobblestone.png', 'cobblestone', '#807f80'),
(111, NULL, './server/media/blocks/composter_bottom.png', 'composter bottom', '#754820'),
(112, NULL, './server/media/blocks/composter_side.png', 'composter side', '#704620'),
(113, NULL, './server/media/blocks/copper_block.png', 'copper block', '#c06c50'),
(114, NULL, './server/media/blocks/copper_bulb.png', 'copper bulb', '#9c5739'),
(115, NULL, './server/media/blocks/copper_bulb_lit.png', 'copper bulb lit', '#d8976b'),
(116, NULL, './server/media/blocks/copper_bulb_lit_powered.png', 'copper bulb lit powered', '#d8966a'),
(117, NULL, './server/media/blocks/copper_bulb_powered.png', 'copper bulb powered', '#9d5639'),
(118, NULL, './server/media/blocks/copper_grate.png', 'copper grate', '#864b37'),
(119, NULL, './server/media/blocks/copper_ore.png', 'copper ore', '#7d7e78'),
(120, NULL, './server/media/blocks/copper_trapdoor.png', 'copper trapdoor', '#98553f'),
(121, NULL, './server/media/blocks/cracked_deepslate_bricks.png', 'cracked deepslate bricks', '#414141'),
(122, NULL, './server/media/blocks/cracked_deepslate_tiles.png', 'cracked deepslate tiles', '#353535'),
(123, NULL, './server/media/blocks/cracked_nether_bricks.png', 'cracked nether bricks', '#291418'),
(124, NULL, './server/media/blocks/cracked_polished_blackstone_bricks.png', 'cracked polished blackstone bricks', '#2c262c'),
(125, NULL, './server/media/blocks/cracked_stone_bricks.png', 'cracked stone bricks', '#767676'),
(126, NULL, './server/media/blocks/crafter_bottom.png', 'crafter bottom', '#4f4f4f'),
(127, NULL, './server/media/blocks/crafter_east.png', 'crafter east', '#7f725d'),
(128, NULL, './server/media/blocks/crafter_east_triggered.png', 'crafter east triggered', '#81725d'),
(129, NULL, './server/media/blocks/crafter_north.png', 'crafter north', '#726d65'),
(130, NULL, './server/media/blocks/crafter_south.png', 'crafter south', '#7b7161'),
(131, NULL, './server/media/blocks/crafter_top.png', 'crafter top', '#706364'),
(132, NULL, './server/media/blocks/crafter_west.png', 'crafter west', '#81735f'),
(133, NULL, './server/media/blocks/crafting_table_front.png', 'crafting table front', '#816a47'),
(134, NULL, './server/media/blocks/crafting_table_side.png', 'crafting table side', '#81673f'),
(135, NULL, './server/media/blocks/crafting_table_top.png', 'crafting table top', '#78492b'),
(136, NULL, './server/media/blocks/creaking_heart.png', 'creaking heart', '#52443f'),
(137, NULL, './server/media/blocks/creaking_heart_top.png', 'creaking heart top', '#493c37'),
(138, NULL, './server/media/blocks/crimson_nylium.png', 'crimson nylium', '#832020'),
(139, NULL, './server/media/blocks/crimson_nylium_side.png', 'crimson nylium side', '#6b1b1b'),
(140, NULL, './server/media/blocks/crimson_planks.png', 'crimson planks', '#653147'),
(141, NULL, './server/media/blocks/crimson_stem.png', 'crimson stem', '#5e1a1f'),
(142, NULL, './server/media/blocks/crimson_stem_top.png', 'crimson stem top', '#713246'),
(143, NULL, './server/media/blocks/crimson_trapdoor.png', 'crimson trapdoor', '#582b3d'),
(144, NULL, './server/media/blocks/crying_obsidian.png', 'crying obsidian', '#210a3d'),
(145, NULL, './server/media/blocks/cut_copper.png', 'cut copper', '#bf6b51'),
(146, NULL, './server/media/blocks/cut_red_sandstone.png', 'cut red sandstone', '#bd6620'),
(147, NULL, './server/media/blocks/cut_sandstone.png', 'cut sandstone', '#dacfa0'),
(148, NULL, './server/media/blocks/cyan_concrete.png', 'cyan concrete', '#157788'),
(149, NULL, './server/media/blocks/cyan_concrete_powder.png', 'cyan concrete powder', '#25949d'),
(150, NULL, './server/media/blocks/cyan_glazed_terracotta.png', 'cyan glazed terracotta', '#34777d'),
(151, NULL, './server/media/blocks/cyan_shulker_box.png', 'cyan shulker box', '#147987'),
(152, NULL, './server/media/blocks/cyan_stained_glass.png', 'cyan stained glass', '#4c7f99'),
(153, NULL, './server/media/blocks/cyan_terracotta.png', 'cyan terracotta', '#575b5b'),
(154, NULL, './server/media/blocks/cyan_wool.png', 'cyan wool', '#158a91'),
(155, NULL, './server/media/blocks/dark_oak_leaves.png', 'dark oak leaves', '#6a6a6a'),
(156, NULL, './server/media/blocks/dark_oak_log.png', 'dark oak log', '#3c2f1a'),
(157, NULL, './server/media/blocks/dark_oak_log_top.png', 'dark oak log top', '#442d17'),
(158, NULL, './server/media/blocks/dark_oak_planks.png', 'dark oak planks', '#432b14'),
(159, NULL, './server/media/blocks/dark_oak_trapdoor.png', 'dark oak trapdoor', '#4b3217'),
(160, NULL, './server/media/blocks/dark_prismarine.png', 'dark prismarine', '#345c4c'),
(161, NULL, './server/media/blocks/daylight_detector_inverted_top.png', 'daylight detector inverted top', '#6a6e70'),
(162, NULL, './server/media/blocks/daylight_detector_top.png', 'daylight detector top', '#83745f'),
(163, NULL, './server/media/blocks/dead_brain_coral_block.png', 'dead brain coral block', '#7c7672'),
(164, NULL, './server/media/blocks/dead_bubble_coral_block.png', 'dead bubble coral block', '#847c78'),
(165, NULL, './server/media/blocks/dead_fire_coral_block.png', 'dead fire coral block', '#847c78'),
(166, NULL, './server/media/blocks/dead_horn_coral_block.png', 'dead horn coral block', '#867e7a'),
(167, NULL, './server/media/blocks/dead_tube_coral_block.png', 'dead tube coral block', '#837b78'),
(168, NULL, './server/media/blocks/deepslate.png', 'deepslate', '#505053'),
(169, NULL, './server/media/blocks/deepslate_bricks.png', 'deepslate bricks', '#474747'),
(170, NULL, './server/media/blocks/deepslate_coal_ore.png', 'deepslate coal ore', '#4a4b4c'),
(171, NULL, './server/media/blocks/deepslate_copper_ore.png', 'deepslate copper ore', '#5c5d59'),
(172, NULL, './server/media/blocks/deepslate_diamond_ore.png', 'deepslate diamond ore', '#536b6b'),
(173, NULL, './server/media/blocks/deepslate_emerald_ore.png', 'deepslate emerald ore', '#4f6858'),
(174, NULL, './server/media/blocks/deepslate_gold_ore.png', 'deepslate gold ore', '#73674e'),
(175, NULL, './server/media/blocks/deepslate_iron_ore.png', 'deepslate iron ore', '#6b645f'),
(176, NULL, './server/media/blocks/deepslate_lapis_ore.png', 'deepslate lapis ore', '#505b73'),
(177, NULL, './server/media/blocks/deepslate_redstone_ore.png', 'deepslate redstone ore', '#69494b'),
(178, NULL, './server/media/blocks/deepslate_tiles.png', 'deepslate tiles', '#373737'),
(179, NULL, './server/media/blocks/deepslate_top.png', 'deepslate top', '#57575a'),
(180, NULL, './server/media/blocks/diamond_block.png', 'diamond block', '#62ede4'),
(181, NULL, './server/media/blocks/diamond_ore.png', 'diamond ore', '#798d8d'),
(182, NULL, './server/media/blocks/diorite.png', 'diorite', '#bdbcbd'),
(183, NULL, './server/media/blocks/dirt.png', 'dirt', '#866043'),
(184, NULL, './server/media/blocks/dirt_path_side.png', 'dirt path side', '#805f3e'),
(185, NULL, './server/media/blocks/dirt_path_top.png', 'dirt path top', '#947a41'),
(186, NULL, './server/media/blocks/dispenser_front.png', 'dispenser front', '#7a7a7a'),
(187, NULL, './server/media/blocks/dispenser_front_vertical.png', 'dispenser front vertical', '#636262'),
(188, NULL, './server/media/blocks/dried_kelp_bottom.png', 'dried kelp bottom', '#323b27'),
(189, NULL, './server/media/blocks/dried_kelp_side.png', 'dried kelp side', '#26311e'),
(190, NULL, './server/media/blocks/dried_kelp_top.png', 'dried kelp top', '#323b27'),
(191, NULL, './server/media/blocks/dripstone_block.png', 'dripstone block', '#866c5d'),
(192, NULL, './server/media/blocks/dropper_front.png', 'dropper front', '#7a7a7a'),
(193, NULL, './server/media/blocks/dropper_front_vertical.png', 'dropper front vertical', '#626161'),
(194, NULL, './server/media/blocks/emerald_block.png', 'emerald block', '#2acb58'),
(195, NULL, './server/media/blocks/emerald_ore.png', 'emerald ore', '#6c8874'),
(196, NULL, './server/media/blocks/enchanting_table_bottom.png', 'enchanting table bottom', '#0f0b19'),
(197, NULL, './server/media/blocks/enchanting_table_top.png', 'enchanting table top', '#814b55'),
(198, NULL, './server/media/blocks/end_portal_frame_top.png', 'end portal frame top', '#5b7961'),
(199, NULL, './server/media/blocks/end_stone.png', 'end stone', '#dcdf9e'),
(200, NULL, './server/media/blocks/end_stone_bricks.png', 'end stone bricks', '#dbe0a2'),
(201, NULL, './server/media/blocks/exposed_chiseled_copper.png', 'exposed chiseled copper', '#9b7765'),
(202, NULL, './server/media/blocks/exposed_copper.png', 'exposed copper', '#a17e68'),
(203, NULL, './server/media/blocks/exposed_copper_bulb.png', 'exposed copper bulb', '#876b5a'),
(204, NULL, './server/media/blocks/exposed_copper_bulb_lit.png', 'exposed copper bulb lit', '#c29164'),
(205, NULL, './server/media/blocks/exposed_copper_bulb_lit_powered.png', 'exposed copper bulb lit powered', '#c39063'),
(206, NULL, './server/media/blocks/exposed_copper_bulb_powered.png', 'exposed copper bulb powered', '#886a59'),
(207, NULL, './server/media/blocks/exposed_copper_grate.png', 'exposed copper grate', '#715849'),
(208, NULL, './server/media/blocks/exposed_copper_trapdoor.png', 'exposed copper trapdoor', '#806454'),
(209, NULL, './server/media/blocks/exposed_cut_copper.png', 'exposed cut copper', '#9b7a65'),
(210, NULL, './server/media/blocks/farmland.png', 'farmland', '#8f6747'),
(211, NULL, './server/media/blocks/farmland_moist.png', 'farmland moist', '#522d10'),
(212, NULL, './server/media/blocks/fire_coral_block.png', 'fire coral block', '#a4232f'),
(213, NULL, './server/media/blocks/fletching_table_front.png', 'fletching table front', '#ad9b6f'),
(214, NULL, './server/media/blocks/fletching_table_side.png', 'fletching table side', '#c0a782'),
(215, NULL, './server/media/blocks/fletching_table_top.png', 'fletching table top', '#c5b485'),
(216, NULL, './server/media/blocks/flowering_azalea_leaves.png', 'flowering azalea leaves', '#505931'),
(217, NULL, './server/media/blocks/flowering_azalea_top.png', 'flowering azalea top', '#707a40'),
(218, NULL, './server/media/blocks/furnace_front.png', 'furnace front', '#5c5b5b'),
(219, NULL, './server/media/blocks/furnace_front_on.png', 'furnace front on', '#79715e'),
(220, NULL, './server/media/blocks/furnace_side.png', 'furnace side', '#797878'),
(221, NULL, './server/media/blocks/furnace_top.png', 'furnace top', '#6e6e6e'),
(222, NULL, './server/media/blocks/gilded_blackstone.png', 'gilded blackstone', '#382b26'),
(223, NULL, './server/media/blocks/glass.png', 'glass', '#8c9697'),
(224, NULL, './server/media/blocks/glowstone.png', 'glowstone', '#ac8354'),
(225, NULL, './server/media/blocks/gold_block.png', 'gold block', '#f7d03e'),
(226, NULL, './server/media/blocks/gold_ore.png', 'gold ore', '#91866b'),
(227, NULL, './server/media/blocks/granite.png', 'granite', '#956756'),
(228, NULL, './server/media/blocks/grass_block_side.png', 'grass block side', '#7f6b42'),
(230, NULL, './server/media/blocks/grass_block_snow.png', 'grass block snow', '#aa9785'),
(231, NULL, './server/media/blocks/grass_block_top.png', 'grass block top', '#949494'),
(232, NULL, './server/media/blocks/gravel.png', 'gravel', '#84807f'),
(233, NULL, './server/media/blocks/gray_concrete.png', 'gray concrete', '#373a3e'),
(234, NULL, './server/media/blocks/gray_concrete_powder.png', 'gray concrete powder', '#4d5155'),
(235, NULL, './server/media/blocks/gray_glazed_terracotta.png', 'gray glazed terracotta', '#535a5e'),
(236, NULL, './server/media/blocks/gray_shulker_box.png', 'gray shulker box', '#373b3f'),
(237, NULL, './server/media/blocks/gray_stained_glass.png', 'gray stained glass', '#4c4c4c'),
(238, NULL, './server/media/blocks/gray_terracotta.png', 'gray terracotta', '#3a2b24'),
(239, NULL, './server/media/blocks/gray_wool.png', 'gray wool', '#3f4448'),
(240, NULL, './server/media/blocks/green_concrete.png', 'green concrete', '#495b25'),
(241, NULL, './server/media/blocks/green_concrete_powder.png', 'green concrete powder', '#61772d'),
(242, NULL, './server/media/blocks/green_glazed_terracotta.png', 'green glazed terracotta', '#758e44'),
(243, NULL, './server/media/blocks/green_shulker_box.png', 'green shulker box', '#4f6520'),
(244, NULL, './server/media/blocks/green_stained_glass.png', 'green stained glass', '#667f33'),
(245, NULL, './server/media/blocks/green_terracotta.png', 'green terracotta', '#4c532a'),
(246, NULL, './server/media/blocks/green_wool.png', 'green wool', '#556e1b'),
(247, NULL, './server/media/blocks/hay_block_side.png', 'hay block side', '#a68926'),
(248, NULL, './server/media/blocks/hay_block_top.png', 'hay block top', '#a68b0d'),
(249, NULL, './server/media/blocks/honeycomb_block.png', 'honeycomb block', '#e5951e'),
(250, NULL, './server/media/blocks/honey_block_bottom.png', 'honey block bottom', '#f19212'),
(251, NULL, './server/media/blocks/honey_block_side.png', 'honey block side', '#fbbc3a'),
(252, NULL, './server/media/blocks/honey_block_top.png', 'honey block top', '#fbb935'),
(253, NULL, './server/media/blocks/horn_coral_block.png', 'horn coral block', '#d8c842'),
(254, NULL, './server/media/blocks/ice.png', 'ice', '#92b8fe'),
(255, NULL, './server/media/blocks/iron_block.png', 'iron block', '#dcdcdc'),
(256, NULL, './server/media/blocks/iron_ore.png', 'iron ore', '#88817b'),
(257, NULL, './server/media/blocks/iron_trapdoor.png', 'iron trapdoor', '#afaeae'),
(258, NULL, './server/media/blocks/jack_o_lantern.png', 'jack o lantern', '#d79935'),
(259, NULL, './server/media/blocks/jigsaw_bottom.png', 'jigsaw bottom', '#221b26'),
(260, NULL, './server/media/blocks/jigsaw_lock.png', 'jigsaw lock', '#2d262f'),
(261, NULL, './server/media/blocks/jigsaw_side.png', 'jigsaw side', '#3f3640'),
(262, NULL, './server/media/blocks/jigsaw_top.png', 'jigsaw top', '#504651'),
(263, NULL, './server/media/blocks/jukebox_side.png', 'jukebox side', '#593b29'),
(264, NULL, './server/media/blocks/jukebox_top.png', 'jukebox top', '#5e412f'),
(265, NULL, './server/media/blocks/jungle_leaves.png', 'jungle leaves', '#6d6b64'),
(266, NULL, './server/media/blocks/jungle_log.png', 'jungle log', '#554419'),
(267, NULL, './server/media/blocks/jungle_log_top.png', 'jungle log top', '#966d47'),
(268, NULL, './server/media/blocks/jungle_planks.png', 'jungle planks', '#a07351'),
(269, NULL, './server/media/blocks/jungle_trapdoor.png', 'jungle trapdoor', '#805c41'),
(270, NULL, './server/media/blocks/ladder.png', 'ladder', '#46371f'),
(271, NULL, './server/media/blocks/lapis_block.png', 'lapis block', '#1f438c'),
(272, NULL, './server/media/blocks/lapis_ore.png', 'lapis ore', '#6b768d'),
(274, NULL, './server/media/blocks/light_blue_concrete.png', 'light blue concrete', '#2489c7'),
(275, NULL, './server/media/blocks/light_blue_concrete_powder.png', 'light blue concrete powder', '#4ab5d5'),
(276, NULL, './server/media/blocks/light_blue_glazed_terracotta.png', 'light blue glazed terracotta', '#5fa5d1'),
(277, NULL, './server/media/blocks/light_blue_shulker_box.png', 'light blue shulker box', '#31a4d4'),
(278, NULL, './server/media/blocks/light_blue_stained_glass.png', 'light blue stained glass', '#6699d8'),
(279, NULL, './server/media/blocks/light_blue_terracotta.png', 'light blue terracotta', '#726d8a'),
(280, NULL, './server/media/blocks/light_blue_wool.png', 'light blue wool', '#3aafda'),
(281, NULL, './server/media/blocks/light_gray_concrete.png', 'light gray concrete', '#7d7d73'),
(282, NULL, './server/media/blocks/light_gray_concrete_powder.png', 'light gray concrete powder', '#9b9b94'),
(283, NULL, './server/media/blocks/light_gray_glazed_terracotta.png', 'light gray glazed terracotta', '#90a6a8'),
(284, NULL, './server/media/blocks/light_gray_shulker_box.png', 'light gray shulker box', '#7c7c73'),
(285, NULL, './server/media/blocks/light_gray_stained_glass.png', 'light gray stained glass', '#999999'),
(286, NULL, './server/media/blocks/light_gray_terracotta.png', 'light gray terracotta', '#886b62'),
(287, NULL, './server/media/blocks/light_gray_wool.png', 'light gray wool', '#8e8e87'),
(288, NULL, './server/media/blocks/lime_concrete.png', 'lime concrete', '#5ea919'),
(289, NULL, './server/media/blocks/lime_concrete_powder.png', 'lime concrete powder', '#7dbd2a'),
(290, NULL, './server/media/blocks/lime_glazed_terracotta.png', 'lime glazed terracotta', '#a3c637'),
(291, NULL, './server/media/blocks/lime_shulker_box.png', 'lime shulker box', '#64ad17'),
(292, NULL, './server/media/blocks/lime_stained_glass.png', 'lime stained glass', '#7fcc19'),
(293, NULL, './server/media/blocks/lime_terracotta.png', 'lime terracotta', '#677635'),
(294, NULL, './server/media/blocks/lime_wool.png', 'lime wool', '#70b91a'),
(295, NULL, './server/media/blocks/lodestone_side.png', 'lodestone side', '#78787b'),
(296, NULL, './server/media/blocks/lodestone_top.png', 'lodestone top', '#939599'),
(297, NULL, './server/media/blocks/loom_bottom.png', 'loom bottom', '#4c3c24'),
(298, NULL, './server/media/blocks/loom_front.png', 'loom front', '#947752'),
(299, NULL, './server/media/blocks/loom_side.png', 'loom side', '#926549'),
(300, NULL, './server/media/blocks/loom_top.png', 'loom top', '#8e775c'),
(301, NULL, './server/media/blocks/magenta_concrete.png', 'magenta concrete', '#a9319f'),
(302, NULL, './server/media/blocks/magenta_concrete_powder.png', 'magenta concrete powder', '#c154b9'),
(303, NULL, './server/media/blocks/magenta_glazed_terracotta.png', 'magenta glazed terracotta', '#d064c0'),
(304, NULL, './server/media/blocks/magenta_shulker_box.png', 'magenta shulker box', '#ae36a4'),
(305, NULL, './server/media/blocks/magenta_stained_glass.png', 'magenta stained glass', '#b24cd8'),
(306, NULL, './server/media/blocks/magenta_terracotta.png', 'magenta terracotta', '#96586d'),
(307, NULL, './server/media/blocks/magenta_wool.png', 'magenta wool', '#be45b4'),
(308, NULL, './server/media/blocks/magma.png', 'magma', '#904222'),
(309, NULL, './server/media/blocks/mangrove_leaves.png', 'mangrove leaves', '#6b6a6a'),
(310, NULL, './server/media/blocks/mangrove_log.png', 'mangrove log', '#544329'),
(311, NULL, './server/media/blocks/mangrove_log_top.png', 'mangrove log top', '#67312a'),
(312, NULL, './server/media/blocks/mangrove_planks.png', 'mangrove planks', '#763631'),
(313, NULL, './server/media/blocks/mangrove_roots_side.png', 'mangrove roots side', '#292115'),
(314, NULL, './server/media/blocks/mangrove_roots_top.png', 'mangrove roots top', '#34291b'),
(315, NULL, './server/media/blocks/mangrove_trapdoor.png', 'mangrove trapdoor', '#612925'),
(316, NULL, './server/media/blocks/melon_side.png', 'melon side', '#72921e'),
(317, NULL, './server/media/blocks/melon_top.png', 'melon top', '#6f911f'),
(318, NULL, './server/media/blocks/mossy_cobblestone.png', 'mossy cobblestone', '#6e775f'),
(319, NULL, './server/media/blocks/mossy_stone_bricks.png', 'mossy stone bricks', '#737969'),
(320, NULL, './server/media/blocks/moss_block.png', 'moss block', '#596e2d'),
(321, NULL, './server/media/blocks/mud.png', 'mud', '#3c3a3d'),
(322, NULL, './server/media/blocks/muddy_mangrove_roots_side.png', 'muddy mangrove roots side', '#443b30'),
(323, NULL, './server/media/blocks/muddy_mangrove_roots_top.png', 'muddy mangrove roots top', '#463b2d'),
(324, NULL, './server/media/blocks/mud_bricks.png', 'mud bricks', '#89684f'),
(325, NULL, './server/media/blocks/mushroom_block_inside.png', 'mushroom block inside', '#caaa78'),
(326, NULL, './server/media/blocks/mushroom_stem.png', 'mushroom stem', '#cbc5ba'),
(327, NULL, './server/media/blocks/mycelium_side.png', 'mycelium side', '#725848'),
(328, NULL, './server/media/blocks/mycelium_top.png', 'mycelium top', '#6f6365'),
(329, NULL, './server/media/blocks/netherite_block.png', 'netherite block', '#433e40'),
(330, NULL, './server/media/blocks/netherrack.png', 'netherrack', '#622626'),
(331, NULL, './server/media/blocks/nether_bricks.png', 'nether bricks', '#2c161a'),
(332, NULL, './server/media/blocks/nether_gold_ore.png', 'nether gold ore', '#73372a'),
(333, NULL, './server/media/blocks/nether_quartz_ore.png', 'nether quartz ore', '#76423e'),
(334, NULL, './server/media/blocks/nether_wart_block.png', 'nether wart block', '#730302'),
(335, NULL, './server/media/blocks/note_block.png', 'note block', '#593b29'),
(336, NULL, './server/media/blocks/oak_leaves.png', 'oak leaves', '#616161'),
(337, NULL, './server/media/blocks/oak_log.png', 'oak log', '#6d5533'),
(338, NULL, './server/media/blocks/oak_log_top.png', 'oak log top', '#987a49'),
(339, NULL, './server/media/blocks/oak_planks.png', 'oak planks', '#a2834f'),
(340, NULL, './server/media/blocks/oak_trapdoor.png', 'oak trapdoor', '#6b5531'),
(341, NULL, './server/media/blocks/observer_back.png', 'observer back', '#484646'),
(342, NULL, './server/media/blocks/observer_back_on.png', 'observer back on', '#4d4545'),
(343, NULL, './server/media/blocks/observer_front.png', 'observer front', '#686868'),
(344, NULL, './server/media/blocks/observer_side.png', 'observer side', '#464545'),
(345, NULL, './server/media/blocks/observer_top.png', 'observer top', '#636363'),
(346, NULL, './server/media/blocks/obsidian.png', 'obsidian', '#0f0b19'),
(347, NULL, './server/media/blocks/ochre_froglight_side.png', 'ochre froglight side', '#f5e9b6'),
(348, NULL, './server/media/blocks/ochre_froglight_top.png', 'ochre froglight top', '#fbf5cf'),
(349, NULL, './server/media/blocks/orange_concrete.png', 'orange concrete', '#e06101'),
(350, NULL, './server/media/blocks/orange_concrete_powder.png', 'orange concrete powder', '#e38420'),
(351, NULL, './server/media/blocks/orange_glazed_terracotta.png', 'orange glazed terracotta', '#9b945c'),
(352, NULL, './server/media/blocks/orange_shulker_box.png', 'orange shulker box', '#ea6a09'),
(353, NULL, './server/media/blocks/orange_stained_glass.png', 'orange stained glass', '#d87f33'),
(354, NULL, './server/media/blocks/orange_terracotta.png', 'orange terracotta', '#a25426'),
(355, NULL, './server/media/blocks/orange_wool.png', 'orange wool', '#f17614'),
(356, NULL, './server/media/blocks/oxidized_chiseled_copper.png', 'oxidized chiseled copper', '#54a284'),
(357, NULL, './server/media/blocks/oxidized_copper.png', 'oxidized copper', '#52a385'),
(358, NULL, './server/media/blocks/oxidized_copper_bulb.png', 'oxidized copper bulb', '#46846d'),
(359, NULL, './server/media/blocks/oxidized_copper_bulb_lit.png', 'oxidized copper bulb lit', '#879a68'),
(360, NULL, './server/media/blocks/oxidized_copper_bulb_lit_powered.png', 'oxidized copper bulb lit powered', '#889967'),
(361, NULL, './server/media/blocks/oxidized_copper_bulb_powered.png', 'oxidized copper bulb powered', '#48836c'),
(362, NULL, './server/media/blocks/oxidized_copper_grate.png', 'oxidized copper grate', '#39715c'),
(363, NULL, './server/media/blocks/oxidized_copper_trapdoor.png', 'oxidized copper trapdoor', '#438069'),
(364, NULL, './server/media/blocks/oxidized_cut_copper.png', 'oxidized cut copper', '#509a7f'),
(365, NULL, './server/media/blocks/packed_ice.png', 'packed ice', '#8eb4fb'),
(366, NULL, './server/media/blocks/packed_mud.png', 'packed mud', '#8e6b50'),
(367, NULL, './server/media/blocks/pale_moss_block.png', 'pale moss block', '#6b7069'),
(368, NULL, './server/media/blocks/pale_moss_carpet.png', 'pale moss carpet', '#6b7069'),
(369, NULL, './server/media/blocks/pale_oak_leaves.png', 'pale oak leaves', '#5f635d'),
(370, NULL, './server/media/blocks/pale_oak_log.png', 'pale oak log', '#584e4b'),
(371, NULL, './server/media/blocks/pale_oak_log_top.png', 'pale oak log top', '#c7bebc'),
(372, NULL, './server/media/blocks/pale_oak_planks.png', 'pale oak planks', '#e4dad8'),
(373, NULL, './server/media/blocks/pale_oak_trapdoor.png', 'pale oak trapdoor', '#e6dcdb'),
(374, NULL, './server/media/blocks/pearlescent_froglight_side.png', 'pearlescent froglight side', '#ece1e5'),
(375, NULL, './server/media/blocks/pearlescent_froglight_top.png', 'pearlescent froglight top', '#f6f0f0'),
(376, NULL, './server/media/blocks/pink_concrete.png', 'pink concrete', '#d6658f'),
(377, NULL, './server/media/blocks/pink_concrete_powder.png', 'pink concrete powder', '#e599b5'),
(378, NULL, './server/media/blocks/pink_glazed_terracotta.png', 'pink glazed terracotta', '#eb9bb6'),
(379, NULL, './server/media/blocks/pink_shulker_box.png', 'pink shulker box', '#e67a9e'),
(380, NULL, './server/media/blocks/pink_stained_glass.png', 'pink stained glass', '#f27fa5'),
(381, NULL, './server/media/blocks/pink_terracotta.png', 'pink terracotta', '#a24e4f'),
(382, NULL, './server/media/blocks/pink_wool.png', 'pink wool', '#ee8dad'),
(383, NULL, './server/media/blocks/piston_bottom.png', 'piston bottom', '#616161'),
(384, NULL, './server/media/blocks/piston_side.png', 'piston side', '#6e6961'),
(385, NULL, './server/media/blocks/piston_top.png', 'piston top', '#998055'),
(386, NULL, './server/media/blocks/piston_top_sticky.png', 'piston top sticky', '#7b955c'),
(387, NULL, './server/media/blocks/podzol_side.png', 'podzol side', '#7b5839'),
(388, NULL, './server/media/blocks/podzol_top.png', 'podzol top', '#5c3f18'),
(389, NULL, './server/media/blocks/polished_andesite.png', 'polished andesite', '#848786'),
(390, NULL, './server/media/blocks/polished_basalt_side.png', 'polished basalt side', '#59585c'),
(391, NULL, './server/media/blocks/polished_basalt_top.png', 'polished basalt top', '#636365'),
(392, NULL, './server/media/blocks/polished_blackstone.png', 'polished blackstone', '#353139'),
(393, NULL, './server/media/blocks/polished_blackstone_bricks.png', 'polished blackstone bricks', '#302b32'),
(394, NULL, './server/media/blocks/polished_deepslate.png', 'polished deepslate', '#494949'),
(395, NULL, './server/media/blocks/polished_diorite.png', 'polished diorite', '#c1c1c3'),
(396, NULL, './server/media/blocks/polished_granite.png', 'polished granite', '#9a6b59'),
(397, NULL, './server/media/blocks/polished_tuff.png', 'polished tuff', '#626864'),
(398, NULL, './server/media/blocks/powder_snow.png', 'powder snow', '#f8fdfd'),
(399, NULL, './server/media/blocks/prismarine.png', 'prismarine', '#63a292'),
(400, NULL, './server/media/blocks/prismarine_bricks.png', 'prismarine bricks', '#63ac9f'),
(401, NULL, './server/media/blocks/pumpkin_side.png', 'pumpkin side', '#c37318'),
(402, NULL, './server/media/blocks/pumpkin_top.png', 'pumpkin top', '#c67718'),
(403, NULL, './server/media/blocks/purple_concrete.png', 'purple concrete', '#64209c'),
(404, NULL, './server/media/blocks/purple_concrete_powder.png', 'purple concrete powder', '#8438b2'),
(405, NULL, './server/media/blocks/purple_glazed_terracotta.png', 'purple glazed terracotta', '#6e3099'),
(406, NULL, './server/media/blocks/purple_shulker_box.png', 'purple shulker box', '#67209c'),
(407, NULL, './server/media/blocks/purple_stained_glass.png', 'purple stained glass', '#7f3fb2'),
(408, NULL, './server/media/blocks/purple_terracotta.png', 'purple terracotta', '#764656'),
(409, NULL, './server/media/blocks/purple_wool.png', 'purple wool', '#7a2aad'),
(410, NULL, './server/media/blocks/purpur_block.png', 'purpur block', '#aa7eaa'),
(411, NULL, './server/media/blocks/purpur_pillar.png', 'purpur pillar', '#ac81ac'),
(412, NULL, './server/media/blocks/purpur_pillar_top.png', 'purpur pillar top', '#ac80ac'),
(413, NULL, './server/media/blocks/quartz_block_bottom.png', 'quartz block bottom', '#ede7e0'),
(414, NULL, './server/media/blocks/quartz_block_side.png', 'quartz block side', '#ece6df'),
(415, NULL, './server/media/blocks/quartz_block_top.png', 'quartz block top', '#ece6df'),
(416, NULL, './server/media/blocks/quartz_bricks.png', 'quartz bricks', '#ebe5de'),
(417, NULL, './server/media/blocks/quartz_pillar.png', 'quartz pillar', '#ece7e0'),
(418, NULL, './server/media/blocks/quartz_pillar_top.png', 'quartz pillar top', '#ebe6df'),
(419, NULL, './server/media/blocks/raw_copper_block.png', 'raw copper block', '#9a6a4f'),
(420, NULL, './server/media/blocks/raw_gold_block.png', 'raw gold block', '#dea92f'),
(421, NULL, './server/media/blocks/raw_iron_block.png', 'raw iron block', '#a6886c'),
(422, NULL, './server/media/blocks/redstone_block.png', 'redstone block', '#b01905'),
(423, NULL, './server/media/blocks/redstone_lamp.png', 'redstone lamp', '#5f371e'),
(424, NULL, './server/media/blocks/redstone_lamp_on.png', 'redstone lamp on', '#8f663d'),
(425, NULL, './server/media/blocks/redstone_ore.png', 'redstone ore', '#8d6e6e'),
(426, NULL, './server/media/blocks/red_concrete.png', 'red concrete', '#8e2121'),
(427, NULL, './server/media/blocks/red_concrete_powder.png', 'red concrete powder', '#a83633'),
(428, NULL, './server/media/blocks/red_glazed_terracotta.png', 'red glazed terracotta', '#b63c35'),
(429, NULL, './server/media/blocks/red_mushroom_block.png', 'red mushroom block', '#c82f2d'),
(430, NULL, './server/media/blocks/red_nether_bricks.png', 'red nether bricks', '#460709'),
(431, NULL, './server/media/blocks/red_sand.png', 'red sand', '#bf6721'),
(432, NULL, './server/media/blocks/red_sandstone.png', 'red sandstone', '#bb631d'),
(433, NULL, './server/media/blocks/red_sandstone_bottom.png', 'red sandstone bottom', '#ba631c'),
(434, NULL, './server/media/blocks/red_sandstone_top.png', 'red sandstone top', '#b56220'),
(435, NULL, './server/media/blocks/red_shulker_box.png', 'red shulker box', '#8c1f1e'),
(436, NULL, './server/media/blocks/red_stained_glass.png', 'red stained glass', '#993333'),
(437, NULL, './server/media/blocks/red_terracotta.png', 'red terracotta', '#8f3d2f'),
(438, NULL, './server/media/blocks/red_wool.png', 'red wool', '#a12723'),
(439, NULL, './server/media/blocks/reinforced_deepslate_bottom.png', 'reinforced deepslate bottom', '#4f5350'),
(440, NULL, './server/media/blocks/reinforced_deepslate_side.png', 'reinforced deepslate side', '#666d65'),
(441, NULL, './server/media/blocks/reinforced_deepslate_top.png', 'reinforced deepslate top', '#50534f'),
(442, NULL, './server/media/blocks/resin_block.png', 'resin block', '#d96319'),
(443, NULL, './server/media/blocks/resin_bricks.png', 'resin bricks', '#ce5918'),
(444, NULL, './server/media/blocks/respawn_anchor_bottom.png', 'respawn anchor bottom', '#210a3d'),
(445, NULL, './server/media/blocks/respawn_anchor_side0.png', 'respawn anchor side0', '#28183f'),
(446, NULL, './server/media/blocks/respawn_anchor_side1.png', 'respawn anchor side1', '#2a1b41'),
(447, NULL, './server/media/blocks/respawn_anchor_side2.png', 'respawn anchor side2', '#2d1d42'),
(448, NULL, './server/media/blocks/respawn_anchor_side3.png', 'respawn anchor side3', '#2f1e43'),
(449, NULL, './server/media/blocks/respawn_anchor_side4.png', 'respawn anchor side4', '#322044'),
(450, NULL, './server/media/blocks/respawn_anchor_top_off.png', 'respawn anchor top off', '#221634'),
(451, NULL, './server/media/blocks/rooted_dirt.png', 'rooted dirt', '#90684d'),
(452, NULL, './server/media/blocks/sand.png', 'sand', '#dbcfa3'),
(453, NULL, './server/media/blocks/sandstone.png', 'sandstone', '#d9cb9c'),
(454, NULL, './server/media/blocks/sandstone_bottom.png', 'sandstone bottom', '#d8ca9a'),
(455, NULL, './server/media/blocks/sandstone_top.png', 'sandstone top', '#e0d6aa'),
(456, NULL, './server/media/blocks/scaffolding_bottom.png', 'scaffolding bottom', '#554c23'),
(457, NULL, './server/media/blocks/scaffolding_side.png', 'scaffolding side', '#665a2a'),
(458, NULL, './server/media/blocks/scaffolding_top.png', 'scaffolding top', '#b28f5a'),
(459, NULL, './server/media/blocks/sculk.png', 'sculk', '#0d1f25'),
(460, NULL, './server/media/blocks/sculk_catalyst_bottom.png', 'sculk catalyst bottom', '#596d6d'),
(461, NULL, './server/media/blocks/sculk_catalyst_side.png', 'sculk catalyst side', '#4d5e5a'),
(462, NULL, './server/media/blocks/sculk_catalyst_top.png', 'sculk catalyst top', '#0f2026'),
(463, NULL, './server/media/blocks/sea_lantern.png', 'sea lantern', '#acc8bf'),
(464, NULL, './server/media/blocks/shroomlight.png', 'shroomlight', '#f19347'),
(465, NULL, './server/media/blocks/shulker_box.png', 'shulker box', '#8b618b'),
(466, NULL, './server/media/blocks/slime_block.png', 'slime block', '#70c05c'),
(467, NULL, './server/media/blocks/smithing_table_bottom.png', 'smithing table bottom', '#401c18'),
(468, NULL, './server/media/blocks/smithing_table_front.png', 'smithing table front', '#392627'),
(469, NULL, './server/media/blocks/smithing_table_side.png', 'smithing table side', '#372424'),
(470, NULL, './server/media/blocks/smithing_table_top.png', 'smithing table top', '#3a3b47'),
(471, NULL, './server/media/blocks/smoker_bottom.png', 'smoker bottom', '#6c6a68'),
(472, NULL, './server/media/blocks/smoker_front.png', 'smoker front', '#584b3a'),
(473, NULL, './server/media/blocks/smoker_side.png', 'smoker side', '#675c4c'),
(474, NULL, './server/media/blocks/smoker_top.png', 'smoker top', '#555451'),
(475, NULL, './server/media/blocks/smooth_basalt.png', 'smooth basalt', '#49484e'),
(476, NULL, './server/media/blocks/smooth_stone.png', 'smooth stone', '#9f9f9f'),
(477, NULL, './server/media/blocks/snow.png', 'snow', '#f9fefe'),
(478, NULL, './server/media/blocks/soul_sand.png', 'soul sand', '#523e33'),
(479, NULL, './server/media/blocks/soul_soil.png', 'soul soil', '#4c3a2f'),
(480, NULL, './server/media/blocks/spawner.png', 'spawner', '#19202b'),
(481, NULL, './server/media/blocks/sponge.png', 'sponge', '#c4c04b'),
(482, NULL, './server/media/blocks/spruce_leaves.png', 'spruce leaves', '#4f4f4f'),
(483, NULL, './server/media/blocks/spruce_log.png', 'spruce log', '#3b2611'),
(484, NULL, './server/media/blocks/spruce_log_top.png', 'spruce log top', '#6d502f'),
(485, NULL, './server/media/blocks/spruce_planks.png', 'spruce planks', '#735530'),
(486, NULL, './server/media/blocks/spruce_trapdoor.png', 'spruce trapdoor', '#684f30'),
(487, NULL, './server/media/blocks/stone.png', 'stone', '#7e7e7e'),
(488, NULL, './server/media/blocks/stonecutter_bottom.png', 'stonecutter bottom', '#767676'),
(489, NULL, './server/media/blocks/stone_bricks.png', 'stone bricks', '#7b7a7b'),
(490, NULL, './server/media/blocks/stripped_acacia_log.png', 'stripped acacia log', '#af5d3c'),
(491, NULL, './server/media/blocks/stripped_acacia_log_top.png', 'stripped acacia log top', '#a65b34'),
(492, NULL, './server/media/blocks/stripped_bamboo_block.png', 'stripped bamboo block', '#c1ad50'),
(493, NULL, './server/media/blocks/stripped_bamboo_block_top.png', 'stripped bamboo block top', '#b29f49'),
(494, NULL, './server/media/blocks/stripped_birch_log.png', 'stripped birch log', '#c5b076'),
(495, NULL, './server/media/blocks/stripped_birch_log_top.png', 'stripped birch log top', '#bfac75'),
(496, NULL, './server/media/blocks/stripped_cherry_log.png', 'stripped cherry log', '#d79195'),
(497, NULL, './server/media/blocks/stripped_cherry_log_top.png', 'stripped cherry log top', '#dda59e'),
(498, NULL, './server/media/blocks/stripped_crimson_stem.png', 'stripped crimson stem', '#89395a'),
(499, NULL, './server/media/blocks/stripped_crimson_stem_top.png', 'stripped crimson stem top', '#7a3853'),
(500, NULL, './server/media/blocks/stripped_dark_oak_log.png', 'stripped dark oak log', '#493924'),
(501, NULL, './server/media/blocks/stripped_dark_oak_log_top.png', 'stripped dark oak log top', '#422c17'),
(502, NULL, './server/media/blocks/stripped_jungle_log.png', 'stripped jungle log', '#ac8555'),
(503, NULL, './server/media/blocks/stripped_jungle_log_top.png', 'stripped jungle log top', '#a67b52'),
(504, NULL, './server/media/blocks/stripped_mangrove_log.png', 'stripped mangrove log', '#783630'),
(505, NULL, './server/media/blocks/stripped_mangrove_log_top.png', 'stripped mangrove log top', '#6d2c2b'),
(506, NULL, './server/media/blocks/stripped_oak_log.png', 'stripped oak log', '#b19056'),
(507, NULL, './server/media/blocks/stripped_oak_log_top.png', 'stripped oak log top', '#a0824d'),
(508, NULL, './server/media/blocks/stripped_pale_oak_log.png', 'stripped pale oak log', '#f6eeed'),
(509, NULL, './server/media/blocks/stripped_pale_oak_log_top.png', 'stripped pale oak log top', '#ebe3e2'),
(510, NULL, './server/media/blocks/stripped_spruce_log.png', 'stripped spruce log', '#745a34'),
(511, NULL, './server/media/blocks/stripped_spruce_log_top.png', 'stripped spruce log top', '#725733'),
(512, NULL, './server/media/blocks/stripped_warped_stem.png', 'stripped warped stem', '#3a9794'),
(513, NULL, './server/media/blocks/stripped_warped_stem_top.png', 'stripped warped stem top', '#34817d'),
(514, NULL, './server/media/blocks/structure_block.png', 'structure block', '#594a5a'),
(515, NULL, './server/media/blocks/structure_block_corner.png', 'structure block corner', '#453a46'),
(516, NULL, './server/media/blocks/structure_block_data.png', 'structure block data', '#4f4251'),
(517, NULL, './server/media/blocks/structure_block_load.png', 'structure block load', '#463a47'),
(518, NULL, './server/media/blocks/structure_block_save.png', 'structure block save', '#574858'),
(519, NULL, './server/media/blocks/suspicious_gravel_0.png', 'suspicious gravel 0', '#827d7c'),
(520, NULL, './server/media/blocks/suspicious_gravel_1.png', 'suspicious gravel 1', '#817c7b'),
(521, NULL, './server/media/blocks/suspicious_gravel_2.png', 'suspicious gravel 2', '#7e7978'),
(522, NULL, './server/media/blocks/suspicious_gravel_3.png', 'suspicious gravel 3', '#7c7776'),
(523, NULL, './server/media/blocks/suspicious_sand_0.png', 'suspicious sand 0', '#dacc9f'),
(524, NULL, './server/media/blocks/suspicious_sand_1.png', 'suspicious sand 1', '#d9cb9d'),
(525, NULL, './server/media/blocks/suspicious_sand_2.png', 'suspicious sand 2', '#d6c797'),
(526, NULL, './server/media/blocks/suspicious_sand_3.png', 'suspicious sand 3', '#d3c191'),
(527, NULL, './server/media/blocks/target_top.png', 'target top', '#e2aa9e'),
(528, NULL, './server/media/blocks/terracotta.png', 'terracotta', '#985e44'),
(529, NULL, './server/media/blocks/tinted_glass.png', 'tinted glass', '#2c272e'),
(530, NULL, './server/media/blocks/tnt_bottom.png', 'tnt bottom', '#a74336'),
(531, NULL, './server/media/blocks/tnt_side.png', 'tnt side', '#b65854'),
(532, NULL, './server/media/blocks/tnt_top.png', 'tnt top', '#8f3e36'),
(533, NULL, './server/media/blocks/trial_spawner_bottom.png', 'trial spawner bottom', '#202d39'),
(534, NULL, './server/media/blocks/trial_spawner_side_active.png', 'trial spawner side active', '#29323b'),
(535, NULL, './server/media/blocks/trial_spawner_side_active_ominous.png', 'trial spawner side active ominous', '#23323e'),
(536, NULL, './server/media/blocks/trial_spawner_side_inactive.png', 'trial spawner side inactive', '#24333f'),
(537, NULL, './server/media/blocks/trial_spawner_side_inactive_ominous.png', 'trial spawner side inactive ominous', '#1e2d38'),
(538, NULL, './server/media/blocks/trial_spawner_top_active.png', 'trial spawner top active', '#3f515c'),
(539, NULL, './server/media/blocks/trial_spawner_top_active_ominous.png', 'trial spawner top active ominous', '#315464'),
(540, NULL, './server/media/blocks/trial_spawner_top_inactive.png', 'trial spawner top inactive', '#395363'),
(541, NULL, './server/media/blocks/trial_spawner_top_inactive_ominous.png', 'trial spawner top inactive ominous', '#314a5b'),
(542, NULL, './server/media/blocks/tube_coral_block.png', 'tube coral block', '#3157cf'),
(543, NULL, './server/media/blocks/tuff.png', 'tuff', '#6c6d67'),
(544, NULL, './server/media/blocks/tuff_bricks.png', 'tuff bricks', '#62675f'),
(545, NULL, './server/media/blocks/vault_bottom.png', 'vault bottom', '#2c2b38'),
(546, NULL, './server/media/blocks/vault_bottom_ominous.png', 'vault bottom ominous', '#2c2b38'),
(547, NULL, './server/media/blocks/vault_front_off.png', 'vault front off', '#2c3840'),
(548, NULL, './server/media/blocks/vault_front_off_ominous.png', 'vault front off ominous', '#353e42'),
(549, NULL, './server/media/blocks/vault_front_on.png', 'vault front on', '#343739'),
(550, NULL, './server/media/blocks/vault_front_on_ominous.png', 'vault front on ominous', '#314044'),
(551, NULL, './server/media/blocks/vault_side_off.png', 'vault side off', '#2d383d'),
(552, NULL, './server/media/blocks/vault_side_off_ominous.png', 'vault side off ominous', '#2d383d'),
(553, NULL, './server/media/blocks/vault_side_on.png', 'vault side on', '#333636'),
(554, NULL, './server/media/blocks/vault_side_on_ominous.png', 'vault side on ominous', '#25393e'),
(555, NULL, './server/media/blocks/vault_top.png', 'vault top', '#36464f'),
(556, NULL, './server/media/blocks/vault_top_ominous.png', 'vault top ominous', '#454947'),
(557, NULL, './server/media/blocks/verdant_froglight_side.png', 'verdant froglight side', '#d3ebd0'),
(558, NULL, './server/media/blocks/verdant_froglight_top.png', 'verdant froglight top', '#e5f5e4'),
(559, NULL, './server/media/blocks/warped_nylium.png', 'warped nylium', '#2b7265'),
(560, NULL, './server/media/blocks/warped_nylium_side.png', 'warped nylium side', '#493e3c'),
(561, NULL, './server/media/blocks/warped_planks.png', 'warped planks', '#2b6963'),
(562, NULL, './server/media/blocks/warped_stem.png', 'warped stem', '#3a3b4e'),
(563, NULL, './server/media/blocks/warped_stem_top.png', 'warped stem top', '#366e6e'),
(564, NULL, './server/media/blocks/warped_trapdoor.png', 'warped trapdoor', '#255e58'),
(565, NULL, './server/media/blocks/warped_wart_block.png', 'warped wart block', '#177879'),
(566, NULL, './server/media/blocks/water_overlay.png', 'water overlay', '#a5a5a5'),
(567, NULL, './server/media/blocks/weathered_chiseled_copper.png', 'weathered chiseled copper', '#69976f'),
(568, NULL, './server/media/blocks/weathered_copper.png', 'weathered copper', '#6c996e'),
(569, NULL, './server/media/blocks/weathered_copper_bulb.png', 'weathered copper bulb', '#5d7f64');
INSERT INTO `blocks` (`id`, `mcId`, `path`, `name`, `avgColorHex`) VALUES
(570, NULL, './server/media/blocks/weathered_copper_bulb_lit.png', 'weathered copper bulb lit', '#9c9d63'),
(571, NULL, './server/media/blocks/weathered_copper_bulb_lit_powered.png', 'weathered copper bulb lit powered', '#9e9c62'),
(572, NULL, './server/media/blocks/weathered_copper_bulb_powered.png', 'weathered copper bulb powered', '#5e7d62'),
(573, NULL, './server/media/blocks/weathered_copper_grate.png', 'weathered copper grate', '#4a6b4d'),
(574, NULL, './server/media/blocks/weathered_copper_trapdoor.png', 'weathered copper trapdoor', '#577a58'),
(575, NULL, './server/media/blocks/weathered_cut_copper.png', 'weathered cut copper', '#6e916c'),
(576, NULL, './server/media/blocks/wet_sponge.png', 'wet sponge', '#abb547'),
(577, NULL, './server/media/blocks/white_concrete.png', 'white concrete', '#cfd5d6'),
(578, NULL, './server/media/blocks/white_concrete_powder.png', 'white concrete powder', '#e2e3e4'),
(579, NULL, './server/media/blocks/white_glazed_terracotta.png', 'white glazed terracotta', '#bdd5cb'),
(580, NULL, './server/media/blocks/white_shulker_box.png', 'white shulker box', '#d8dddd'),
(581, NULL, './server/media/blocks/white_stained_glass.png', 'white stained glass', '#ffffff'),
(582, NULL, './server/media/blocks/white_terracotta.png', 'white terracotta', '#d2b2a1'),
(583, NULL, './server/media/blocks/white_wool.png', 'white wool', '#eaeced'),
(584, NULL, './server/media/blocks/yellow_concrete.png', 'yellow concrete', '#f1af16'),
(585, NULL, './server/media/blocks/yellow_concrete_powder.png', 'yellow concrete powder', '#e9c737'),
(586, NULL, './server/media/blocks/yellow_glazed_terracotta.png', 'yellow glazed terracotta', '#eac059'),
(587, NULL, './server/media/blocks/yellow_shulker_box.png', 'yellow shulker box', '#f8bd1d'),
(588, NULL, './server/media/blocks/yellow_stained_glass.png', 'yellow stained glass', '#e5e533'),
(589, NULL, './server/media/blocks/yellow_terracotta.png', 'yellow terracotta', '#ba8523'),
(590, NULL, './server/media/blocks/yellow_wool.png', 'yellow wool', '#f9c628');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buildhacks`
--

CREATE TABLE `buildhacks` (
  `id` int NOT NULL,
  `creator` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `displayImgPath` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `buildhacks`
--

INSERT INTO `buildhacks` (`id`, `creator`, `name`, `description`, `displayImgPath`) VALUES
(24, 4, 'wheelbarrow', 'A cool wheelbarrow for your farm!', './server/media/buildhacks/6a15ab56d6730.png'),
(28, 9, 'Cool Build', 'A cool build', './server/media/buildhacks/6a2e91c6c3ecb.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buildhacks_steps`
--

CREATE TABLE `buildhacks_steps` (
  `id` int NOT NULL,
  `buildhackId` int NOT NULL,
  `path` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `spotInHack` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `buildhacks_steps`
--

INSERT INTO `buildhacks_steps` (`id`, `buildhackId`, `path`, `description`, `spotInHack`) VALUES
(18, 24, './server/media/buildhacks/steps/6a15ab56da47d.png', 'Place a composter.', 1),
(19, 24, './server/media/buildhacks/steps/6a15ab56dea3e.png', 'Place a grindstone facing the composter.', 2),
(20, 24, './server/media/buildhacks/steps/6a15ab56e2efb.png', 'Place a fence gate of your choice facing the opposite side of the composter.', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum`
--

CREATE TABLE `forum` (
  `chatID` int NOT NULL,
  `Message` varchar(1000) NOT NULL,
  `userID` int NOT NULL,
  `img` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `forum`
--

INSERT INTO `forum` (`chatID`, `Message`, `userID`, `img`) VALUES
(4, 'Willkommen zur Froum Seite!', 1, NULL),
(5, 'Ich habe so eine coole Schubkarre gebaut. Meinungen?', 9, './server/media/forum/6a2e8124d6a2a.png'),
(6, 'Schaut cool aus! 👌', 2, NULL),
(7, 'Danke dir ❤️', 9, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `profilePicture` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `profilePicture`) VALUES
(1, 'admin', '$2y$10$r1b.9PAqcN0qd7HpCIajB.Dm.42rhNZIc/pKSbvQbwq4gd//uMJau', 'matthias.schuetz09@gmail.com', './server/media/profilePictures/6a042a685e162.png'),
(2, 'test', '$2y$10$fk0TWLyKaMiH4Pxa1bDsNeYumIQlusDIQQt9O1lfpNf1hO1DB/a.6', NULL, NULL),
(3, 'Cleblatt187', '$2y$10$MJnX1Rciihitu.9rljJEAuRJdAygm1pp/DbTmvsz6Mh52pYJVIW1O', NULL, './server/media/profilePictures/6a1ecf9bc73f1.jpg'),
(4, 'default', '$2y$10$7wIAWU30eQ0K6LRddEZs6OkPJQYaErKuWcum0zgjfXTKDHgkZZp4S', NULL, NULL),
(9, 'Matzgo', '$2y$10$NXETVvC97VAhkGy7fnelwuVFOCP9vuPG6GLkUsliEkyqbXDTYMP1m', 'matthias.schuetz09@gmail.com', './server/media/profilePictures/6a2e80d10dcdd.jpg');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `blockpalettes`
--
ALTER TABLE `blockpalettes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `buildhacks`
--
ALTER TABLE `buildhacks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `buildhacks_steps`
--
ALTER TABLE `buildhacks_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`chatID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `blockpalettes`
--
ALTER TABLE `blockpalettes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT für Tabelle `buildhacks`
--
ALTER TABLE `buildhacks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `buildhacks_steps`
--
ALTER TABLE `buildhacks_steps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `forum`
--
ALTER TABLE `forum`
  MODIFY `chatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
