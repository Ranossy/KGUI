---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_��ʵ��걻�ٻ����.lua
-- ����ʱ��:	2016/7/8 21:42:14
-- �����û�:	wangwei2
-- �ű�˵��:   ��ʹ�������Ĺ����ʧ��Ҳ��Ӱ�����ڻ��εĹ��
----------------------------------------------------------------------<
Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")
function Apply(dwCharacterID, dwSkillSrcID)	
	local new_ghost = GetNpc(dwCharacterID)
	if not new_ghost then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		new_ghost.SetDisappearFrames(1)		
		return
	end
	local scene = player.GetScene()
	if not scene then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		new_ghost.SetDisappearFrames(1)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 2292), 3)
		player.SendSystemMessage(GetEditorString(10, 2293))
		return
	end
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame ~= 0 then
		return
	end
	local new_ghost = GetNpc(nCharacterID)
	if not new_ghost then
		return
	end	
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		new_ghost.SetDisappearFrames(1)		
		return
	end
	local scene = player.GetScene()
	if not scene then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		new_ghost.SetDisappearFrames(1)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 2292), 3)
		player.SendSystemMessage(GetEditorString(10, 2293))
		return
	end
	new_ghost.DoAction(0, 10063)
	Identity_LonelyGhostSummon(fazhen, player, new_ghost) 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com