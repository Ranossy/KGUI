---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ִ����/���ִ�_��ѧ_����.lua
-- ����ʱ��:	2014/7/23 11:55:46
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("MZ_you_" .. player.dwID)
	if npc then
		if npc.nCurrentLife > 1 then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "teach_base.finish_teach" )
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com