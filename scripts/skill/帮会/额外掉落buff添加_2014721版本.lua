---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/�������buff���_2014721�汾.lua
-- ����ʱ��:	2014/7/16 20:21:01
-- �����û�:	xutong3
-- �ű�˵��:	����̫��-��ʱ���ҿɲ��ܡ���
----------------------------------------------------------------------<

Include("scripts/Map/������/include/TongDungeonRaid.lh")
Include("scripts/Map/������/include/��ս���������.lua")

local tMap = {--��2����10�˱�����1����25�˱�������6�㡣��᱾ͳһ��1��-��4907
	[160] = 2,	-- 10��ս����е��
	[171] = 1,	-- 25��ս����е��
	[164] = 2,	-- 10�˴�����
	[165] = 1,	-- 25�˴�����
	[175] = 2,	-- 10��Ѫս���
	[176] = 1, 	-- 25��Ѫս���
	[177] = 2,	-- 10�˷�ѩ�����
	[178] = 1, 	-- 25�˷�ѩ�����
	[182] = 2,	-- 10���ػ���
	[183] = 1, -- 25���ػ���
	[191] = 2,	-- 10��ҹ�ع³�
	[198] = 1, 	-- 25��ҹ�ع³�
	[192] = 2,	-- 10��������
	[199] = 1, -- 25��������
	[211] = 2,	-- 10����սҹ�ع³�
	[205] = 1, 	-- 25����սҹ�ع³�
	[212] = 2,	-- 10����ս������
	[206] = 1, -- 25����ս������
	[220] = 2,	-- 10������ͥ԰
	[231] = 1, 	-- 25������ͥ԰
	[221] = 2,	-- 10�˻��±�Ժ
	[230] = 1, -- 25�˻��±�Ժ
	
	[234] = 2,	-- 10����ս����ͥ԰
	[236] = 1, 	-- 25����ս����ͥ԰
	[235] = 2,	-- 10����ս���±�Ժ
	[237] = 1, -- 25����ս���±�Ժ

	[240] = 2,	-- 10�˹۷��
	[248] = 1, 	-- 25��Ӣ�۹۷��
	[241] = 2,	-- 10��˫��ͤ
	[249] = 1, -- 25��Ӣ��˫��ͤ
	
	--[232] = 1,	-- ��������й�_����ͥ԰  ��᲻��Ҫ�� ͳһ����
	--[233] = 1, 	-- ��������й�_���±�Ժ  ��᲻��Ҫ�� ͳһ����
}

function Apply(dwCharacterID, dwSkillSrcID)
	--�����жϴ���
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	
	--��ָ��raid����᱾����ս����������
	if not tMap[player.GetMapID()] and not TongDungeonRaid.IsTongDungeonMap(scene) and not CurrentMapIsDaZhanMap(scene) then
		return
	end
	local nHuiGuiBuff = 0			--�ع�buff��
	local nTeamNumInDungeon = 0	--Ŀǰ�����е�����
	local tTeamMember = player.GetPartyMemberList()
	if not tTeamMember then
		return
	end
	local buff = player.GetBuff(3220, 10)

	local member = nil
	for i = 1, #tTeamMember do
		member = GetPlayer(tTeamMember[i])
		if member and player.GetMapID() == member.GetMapID() then			
			if scene.dwID == member.GetScene().dwID then
				nTeamNumInDungeon = nTeamNumInDungeon + 1	--��¼��ǰ�����е�����
				if member.GetBuff(3219, 10) then
					nHuiGuiBuff = nHuiGuiBuff + 1				--��¼��ǰ�������й�ս������
				end
			end
		end
	end
	if nHuiGuiBuff >= 2 and (tMap[player.GetMapID()] == 1 or TongDungeonRaid.IsTongDungeonMap(scene)) then
		player.AddBuff(1, 1, 4907, 6)
	end

	--��ս��������һ��11575
	if CurrentMapIsDaZhanMap(scene) then
		if nHuiGuiBuff > 0 and nTeamNumInDungeon >= 2 then	--�й�սbuff�ҵ�ǰ�ؾ�������2��
			AddDaZhanExtraDropBuff(player)					--��һ��������buff
		end
		return
	end	

	--��᱾�������11560�����10��
	if TongDungeonRaid.IsTongDungeonMap(scene) then		
		local nStackNum = math.min(nHuiGuiBuff, 10)
		local buff_Tong = player.GetBuff(11560, 1)
		if nStackNum <= 0 then
			return
		end
		if buff_Tong and buff_Tong.nStackNum == nStackNum and buff_Tong.nLeftActiveCount > 2 then--��ֹƵ����buff�Ĵ�ʩ
			return
		end
		player.DelGroupBuff(11560, 1)
		for i = 1, nStackNum do
			player.AddBuff(0, 99, 11560, 1, 7)
		end
		return
	end

	--Raid���������3220�����6��
	local nBuffStuck = nHuiGuiBuff * tMap[player.GetMapID()]
	if nBuffStuck > 6 then
		nBuffStuck = 6
	end
	if nBuffStuck <= 0 then
		return
	end

	if buff and buff.nStackNum == nBuffStuck and buff.nLeftActiveCount > 2 then--��ֹƵ����buff�Ĵ�ʩ
		return
	end
	player.DelGroupBuff(3220, 10)
	for i = 1, nBuffStuck do
		player.AddBuff(1, 1, 3220, 10, 7)
	end
	--local tbuff = player.GetBuff(3219, 8)
	--local cbuff = player.GetBuff(3220, 8)
	--local zbuff = player.GetBuff(3461, 8)
	--local splayer = GetPlayer(dwSkillSrcID)
	--local slevel = splayer.nLevel
	--local sbuff = player.GetBuff(4907, 4)
	--if not tbuff and not cbuff and not zbuff then
	--player.AddBuff(dwSkillSrcID, slevel, 3220, 8)
	--elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID) or tbuff then
	--player.AddBuff(dwSkillSrcID, slevel, 4907, 4)
	--player.AddBuff(dwSkillSrcID, slevel, 4918, 4)
	--end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com