---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�ƺ����_��������_BUFF����.lua
-- ����ʱ��:	2017/1/10 22:08:57
-- �����û�:	qinfupi
-- �ű�˵��:
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
		return
	end
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame == 0 then
		-- ��Ҽ��������ű��֡�
		player.CastSkill(17260, 1)
		player.CastSkill(7192, 1)		
		-- npc�����������߼�����
		--local npc = scene.GetNpcByNickName("caster")
		--if npc then
		--npc.CastSkill(7165, 1, TARGET.PLAYER, player.dwID)
		--end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com