---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��ʯ�����ͷ�.lua
-- ����ʱ��:	2014/2/26 14:41:24
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 182 then
		npc.CastSkill(8890, 1)
	end

	if scene.dwMapID == 183 then
		npc.CastSkill(8890, 2)
	end
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com