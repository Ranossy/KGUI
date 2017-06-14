---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/貴亣��/��ս����.lua
-- ����ʱ��:	2015/7/1 11:34:11
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(7777)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	if not scene then
		return
	end

			
	if npc.dwTemplateID == 43904 then--���Ļ�
		npc.PlaySfx(132, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7090))
	elseif npc.dwTemplateID == 43905 then--ëë
		npc.PlaySfx(253, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7091))
	elseif npc.dwTemplateID == 43908 then--Ī��
		npc.PlaySfx(241, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7092))
	elseif npc.dwTemplateID == 43909 then --����
		npc.PlaySfx(153, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7093))
	end
			
	
	local playerlist = scene.GetAllPlayer()

	for i = 1, #playerlist do
		local cPlayer = GetPlayer(playerlist[i])
		if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
			cPlayer.Stop()
			
			if npc.dwTemplateID == 43904 then--���Ļ�
				cPlayer.PlaySfx(2,0,0,0)
			elseif npc.dwTemplateID == 43905 then--ëë
				cPlayer.PlaySfx(257,0,0,0)
			elseif npc.dwTemplateID == 43908 then--Ī��
				cPlayer.PlaySfx(2,0,0,0)
			elseif npc.dwTemplateID == 43909 then --����
				cPlayer.PlaySfx(311,0,0,0)
			end
			
			cPlayer.Die()
		end
	end


	--player.PlaySfx(9,0,0,0) �����������ץ�˱�������
	--[[
player.PlaySfx(162 ,0,0,0) --����
	player.PlaySfx(199 ,0,0,0)
	
	player.PlaySfx(179 ,0,0,0)͸������--Ҷ�  player.PlaySfx(248 ,0,0,0) ͸������
	player.PlaySfx(174 ,0,0,0)--��
	player.PlaySfx(186 ,0,0,0)--�����player.PlaySfx(202 ,0,0,0) player.PlaySfx(213 ,0,0,0) player.PlaySfx(215 ,0,0,0) --�������player.PlaySfx(216 ,0,0,0)
	player.PlaySfx(188 ,0,0,0)--�����
	player.PlaySfx(190 ,0,0,0)--��������player.PlaySfx(192 ,0,0,0) player.PlaySfx(247 ,0,0,0)
	player.PlaySfx(208 ,0,0,0)--һ����
	--]]
end

-- ��ͷʵ�ⱸע��һ��BUFF�Ľ����ű��е�UnApply ��������Ч�����ᴥ��
function UnApply(dwCharacterID)
	--�����ű�����Ч
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com