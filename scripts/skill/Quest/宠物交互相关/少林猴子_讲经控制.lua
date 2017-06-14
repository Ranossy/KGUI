---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/���ｻ�����/���ֺ���_��������.lua
-- ����ʱ��:	2016/4/22 22:40:22
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--��ǰ����������ֶ�ȡ������֪ͨ�ܿ��峡--
	if nLeftFrame > 0 then
		local player = GetPlayer(nCharacterID)
		if not player then
			return
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		local npc = scene.GetNpcByNickName("ZK_jiangjing" .. player.dwID)
		if npc then
			npc.FireAIEvent(2002, 0, 0)   --2002�¼��������峡
		end
		player.CloseLonelyMode()
		player.Jump(0, 0)
	end

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com