---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/������_�������缼����Ӧbuff.lua
-- ����ʱ��:	2016/3/27 10:53:56
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
		npc.CastSkill(15692, 1)
	end

	if scene.dwMapID == 248 or scene.dwMapID == 250 then
		npc.CastSkill(15692, 2)
	end
end

function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com