---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/������_����AOE.lua
-- ����ʱ��:	2016/3/22 19:28:15
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if scene.dwMapID == 240 then
		npc.CastSkill(15550, 1)
	end

	if scene.dwMapID == 248 or scene.dwMapID == 250 then
		npc.CastSkill(15550, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com