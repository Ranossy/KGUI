---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_������_�Ծ�_������ʧ.lua
-- ����ʱ��:	2013/9/3 14:25:13
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<

local tDoodad = {
	[1] = 4489,		--Ǭ
	[2] = 4490,		--��
	[3] = 4491,		--��
	[4] = 4492, 		--��
	[5] = 4493,		--��
	[6] = 4494,		--��
	[7] = 4495,		--��
	[8] = 4496,		--��
}
	
local tBUFF = {
	[1] = 6681,		--Ǭ
	[2] = 6682,		--��
	[3] = 6683,		--��
	[4] = 6684, 		--��
	[5] = 6685,		--��
	[6] = 6686,		--��
	[7] = 6687,		--��
	[8] = 6688,		--��
}

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.GetBuff(6666, 1) then
		player.DelBuff(6666, 1)
	end
	if player.GetBuff(6666, 2) then
		player.DelBuff(6666, 2)
	end
	local npcBoss = scene.GetNpcByNickName("wuming")
	if scene.dwMapID == 177 then
		for i = 1, 8 do
			if tBUFF[i] == BuffID then
				local doodadthis = scene.GetDoodadByNickName("guajin_" .. i)
				local npcthis = scene.GetNpcByNickName("guajinbiaoxian_" .. i)
				if npcthis then
					if not doodadthis then
						if npcBoss and npcBoss.GetCustomBoolean(12) == true then
							scene.CreateDoodad(tDoodad[i], npcthis.nX, npcthis.nY, npcthis.nZ, 0, "guajin_" .. i)
							player.SetDynamicSkillGroup(0)
							return
						end
					end
				end
			end
		end
	elseif scene.dwMapID == 178 then
		for i = 1, 8 do
			if tBUFF[i] == BuffID then
				local doodadthis = scene.GetDoodadByNickName("guajin_" .. nCustomValue .. "_" .. i)
				local npcthis = scene.GetNpcByNickName("guajinbiaoxian_" .. i)
				if npcthis then
					if not doodadthis then
						if npcBoss and npcBoss.GetCustomBoolean(12) == true then
							doodadthis = scene.CreateDoodad(tDoodad[i], npcthis.nX, npcthis.nY, npcthis.nZ, 0, "guajin_" .. nCustomValue .. "_" .. i)
							doodadthis.SetCustomInteger1(1, nCustomValue)
							player.SetDynamicSkillGroup(0)
							return
						end
					end
				end
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com