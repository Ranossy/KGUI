---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/������/npc/1��boss/����ı���.lua
-- ����ʱ��:	2015/3/6 10:51:51
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
-- �Ի��¼�����


-- �����¼�����
function OnDeath(npc, killer)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	
	if killer then
		Log("dwNpcTemplateID: " .. npc.dwTemplateID .. ", dwKillerID: " .. killer.dwID .. ", dwDropTargetPlayerID: " .. npc.dwDropTargetPlayerID)
	else
		Log("dwNpcTemplateID: " .. npc.dwTemplateID .. ", killer is nil" .. ", dwDropTargetPlayerID: " .. npc.dwDropTargetPlayerID)
	end
	scene.SetProgress(1, true)
	scene.SaveMap()
	--AddXianRenZhiLuMark(npc)
	--SetTongQuestValue(scene, "����")
end

-- �����¼�����
--function OnNpcRevive(npc)
--end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com