---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_ɽ��_��ʢ��ŭ������.lua
-- ����ʱ��:	2013/11/6 14:28:57
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	local caoxueyang = scene.GetNpcByNickName("caoxueyang")
	if caoxueyang then
		npc.CastSkill(8536, 1)
	end
	
	if not caoxueyang then
		npc.CastSkill(8536, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com