---------------------------------------------------------------------->
-- �ű�����:	Scripts\Map\�����\npc\������.lua
-- ����ʱ��:	08/23/08 17:51:42
-- �����û�:	tangyiming3
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/Map/�����/include/scenestrings.ls")
Include("scripts/Include/Player.lh")

-- NPC�ű�, �Ի��¼�����
function OnDialogue(npc, player)
	player.OpenWindow(TARGET.NPC, npc.dwID, 
		npc.GetAutoDialogString(player.dwID) ..
		SCENE_STRING_TABLE[4122] .. "\n" ..
		SCENE_STRING_TABLE[8257] .. "\n" ..
		SCENE_STRING_TABLE[8247] .. "\n" ..
		SCENE_STRING_TABLE[4583] .. "\n" ..
		SCENE_STRING_TABLE[8256] .. "\n" ..
		SCENE_STRING_TABLE[8258] .. "\n" ..
		SCENE_STRING_TABLE[8259] .. "\n" ..
		SCENE_STRING_TABLE[8250] .. "\n" ..
		SCENE_STRING_TABLE[8251] .. "\n" ..
		SCENE_STRING_TABLE[8252] .. "\n" ..
		SCENE_STRING_TABLE[8245] .. "\n" ..
		SCENE_STRING_TABLE[8249] .. "\n" ..
		SCENE_STRING_TABLE[8254] .. "\n" ..
		SCENE_STRING_TABLE[8248] .. "\n" ..
		SCENE_STRING_TABLE[8255] .. "\n" ..
		SCENE_STRING_TABLE[8246] .. "\n" ..
		SCENE_STRING_TABLE[8253] .. "\n" ..
		SCENE_STRING_TABLE[1526] .. "\n" ..
		SCENE_STRING_TABLE[1521] .. "\n" ..
		SCENE_STRING_TABLE[2859] .. "\n" ..
		SCENE_STRING_TABLE[4381] .. "\n" ..
		SCENE_STRING_TABLE[1519] .. "\n" ..
		SCENE_STRING_TABLE[1522] .. "\n" ..
		SCENE_STRING_TABLE[4382] .. "\n" ..
		SCENE_STRING_TABLE[2548] .. "\n" ..
		SCENE_STRING_TABLE[2800] .. "\n" ..
		SCENE_STRING_TABLE[2846] .. "\n" ..
		SCENE_STRING_TABLE[5422] .. "\n" ..
		SCENE_STRING_TABLE[1523] .. "\n" ..
		SCENE_STRING_TABLE[6149], 
		"GetStandardCourse1", 
		"GetStandardCourse5", 
		"GetStandardCourse10", 
		"GetLevelCourse15", 
		"GetStandardCourse16", 
		"GetStandardCourse20", 
		"GetStandardCourse25", 
		"GetStandardCourse30", 
		"GetStandardCourse32", 
		"GetStandardCourse35", 
		"GetStandardCourse40", 
		"GetStandardCourse45", 
		"GetStandardCourse50", 
		"GetStandardCourse55", 
		"GetStandardCourse60", 
		"GetStandardCourse65", 
		"GetStandardCourse70", 
		"TransportKD", 
		"TransportCY", 
		"TransportTC", 
		"TransportWH", 
		"TransportSL", 
		"TransportLD", 
		"TransportLY", 
		"TransportFB", 
		"TransportJS", 
		"TransportFH", 
		"TransportQX", 
		"TransportYZ", 
		"TransportWY"
	)
end

function GetStandardCourse1(player)
	GetStandardCourse(player, 1)
end
function GetStandardCourse5(player)
	GetStandardCourse(player, 5)
end
function GetStandardCourse10(player)
	GetStandardCourse(player, 10)
end
function GetLevelCourse15(player)
	GetStandardCourse(player, 15)
end
function GetStandardCourse16(player)
	GetStandardCourse(player, 16)
end
function GetStandardCourse20(player)
	GetStandardCourse(player, 20)
end
function GetStandardCourse25(player)
	GetStandardCourse(player, 25)
end
function GetStandardCourse30(player)
	GetStandardCourse(player, 30)
end

function GetStandardCourse32(player)
	GetStandardCourse(player, 32)
end
function GetStandardCourse35(player)
	GetStandardCourse(player, 35)
end
function GetStandardCourse40(player)
	GetStandardCourse(player, 40)
end
function GetStandardCourse45(player)
	GetStandardCourse(player, 45)
end
function GetStandardCourse50(player)
	GetStandardCourse(player, 50)
end
function GetStandardCourse55(player)
	GetStandardCourse(player, 55)
end
function GetStandardCourse60(player)
	GetStandardCourse(player, 60)
end
function GetStandardCourse65(player)
	GetStandardCourse(player, 65)
end
function GetStandardCourse70(player)
	GetStandardCourse(player, 70)
end
function TransportKD(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(10, 12252, 34658, 0)
end

function TransportLD(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(9, 41109, 90956, 0)
end

-- ���͵�����
function TransportLY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(8, 59715, 22363, 0)
end

-- �����ǲ����ò��֣����͵�������ͼ���Լ�һЩ������ʼ��
function TransportCY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(7, 48019, 2697, 0)
	if player.GetItemAmount(6, 887) == 0 then
		player.AddItem(6, 887, 1)
	end
	player.AddItem(7, 1355)
	player.AddItem(7, 1360)
	player.AddItem(7, 1637)
	player.AddItem(7, 1375)
	player.AddItem(7, 1642)	
end

-- �����ǲ����ò��֣����͵���ߵ�ͼ���Լ�һЩ������ʼ��
function TransportTC(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(11, 56796, 3452, 0)
end      

function TransportWH(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(2, 85557, 73351, 0)
end

function TransportSL(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(5, 4500, 16000, 0)
end

function TransportFB(player, nTargetType, nTargetID, nIndex)
	-- ���븱��ǰ��Ҫ����һ�����������, �����ڸ����쳣��ʱ������T������
	player.SetLastEntry(5, 1, 27502, 82386, 1157149, 70)
	player.SwitchMap(14, 32727, 6580, 0)
end

-- �����ǲ����ò��֣����͵���ˮ��ͼ���Լ�һЩ������ʼ��
function TransportJS(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(13, 86754, 5270, 0)
end

function TransportFH(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(12, 8326, 35843, 0)
end

function TransportQX(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(16, 23041, 8855, 1057024)
end	

function TransportWY(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(18, 20809, 5333, 1056575)
end
function TransportYZ(player, nTargetType, nTargetID, nIndex)
	player.SwitchMap(6, 46404, 31598, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com