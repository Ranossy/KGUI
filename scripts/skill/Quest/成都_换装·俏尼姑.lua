------------------------------------------------
-- �ļ���    :  �ɶ�_��װ�������.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-01
------------------------------------------------

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

	local npc_cd = scene.GetNpcByNickName("chengdulaotou_cd")	
	if npc_cd and npc_cd.GetCustomInteger4(24) == player.dwID then
		local npc_cang = scene.GetNpcByNickName("chengdulaotou_cang")
		if npc_cang then 
			player.DelBuff(2697, 1)--����
			npc_cang.SetForceID(28)
			npc_cang.ModifyThreat(player.dwID, 30)
			npc_cang.SayTo(player.dwID,GetEditorString(1, 4727))
			npc_cang.DelBuff(2702, 1)--����ʶ��
			npc_cang.DelBuff(2703, 1)--ȥ���м�
			npc_cang.DelBuff(2690, 1)--ȥ��
			npc_cang.DelBuff(2693, 1)--ȥɫ
			npc_cang.DelBuff(2692, 1)--ȥ��
			npc_cang.DelBuff(2695, 1)--ȥȨ
			npc_cang.AddBuff(0, 99, 2698, 1)--ŭ�𡤼����
		end
		local npc_xuan = scene.GetNpcByNickName("chengdulaotou_xuan")
		if npc_xuan then 
			--�ı�����
			player.DelBuff(2697, 1)--����
			npc_xuan.SetForceID(28)
			npc_xuan.ModifyThreat(player.dwID, 30)
			npc_xuan.SayTo(player.dwID,player.szName .. GetEditorString(1, 5580))
			npc_xuan.DelBuff(2702, 1)--����ʶ��
			npc_xuan.DelBuff(2703, 1)--ȥ���м�
			npc_xuan.DelBuff(2688, 1)--ȥ��
			npc_xuan.DelBuff(2694, 1)--ȥɫ
			npc_xuan.DelBuff(2691, 1)--ȥ��
			npc_xuan.DelBuff(2696, 1)--ȥȨ
			npc_xuan.AddBuff(0, 99, 2698, 1)--ŭ�𡤼����
		end
	end
 
   if nLeftFrame > 0 then
   	
   	
   end	
	if nLeftFrame == 0 then
	
		
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com