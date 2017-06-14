---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_��������Ѫ��.lua
-- ����ʱ��:	2014/10/29 15:12:32
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)
	--local scene = player.GetScene()
	if player then
		local scene = player.GetScene()
		if player.nCurrentLife == player.nMaxLife then
			if scene.dwMapID == 195 then
				player.DelGroupBuff(8480, 1)
			elseif scene.dwMapID == 196 then
				player.DelGroupBuff(8480, 2)
			end
		end
	end

	if npctarget then
		local scene = npctarget.GetScene()
		if npctarget.nCurrentLife == npctarget.nMaxLife then
			if scene.dwMapID == 195 then
				if player then
					player.DelGroupBuff(8480, 1)
				end
			elseif scene.dwMapID == 196 then
				if player then
					player.DelGroupBuff(8480, 2)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com