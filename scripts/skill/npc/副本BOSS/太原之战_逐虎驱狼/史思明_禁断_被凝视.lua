---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/ʷ˼��_����_������.lua
-- ����ʱ��:	2014/10/2 17:59:47
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("boss4_shisiming")
	if not npc then
		return
	end
	--BOSS����ս��������û�п���׷ɱ�ı�ǣ��򲻴���
	if npc.bFightState ~= true or npc.GetCustomInteger1(4) == 0 then
		return
	end

	if nLeftFrame == 0 then    -----��Ȼ�����������ǿBUFF
		local LV = 1
		if scene.dwMapID == 199 then
			LV = 2
		elseif scene.dwMapID == 206 then
			LV = 3
		elseif scene.dwMapID == 212 then
			LV = 4
		end
		player.AddBuff(0, 99, 8342, LV)
	else                       --��ǰ��������BOSS���¼�
		npc.FireAIEvent(2007, 0, nCharacterID)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com