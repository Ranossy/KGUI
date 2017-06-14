------------------------------------------------
-- ������   :  zhangqi	
-- ����ʱ��	:  2011-1-12
-- Ч����ע	:  �嶾_���_�����ƶ� ����ͷż���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function OnOpen(doodad, player)
	local owner = GetPlayer(doodad.dwOwnerID);
	local doodadleftcount = doodad.GetCustomInteger1(0)

	if doodadleftcount <= 0 then
		return false;
	end
	--���owner���ߣ��Ҵ������״̬
	if owner then 
		--��ȡdoodad���������ڶ��顣
		--�����ɫ����һ�������У���ô�����������һ�������������г�ԱID��table����table��������1��ʼ��
		local tParty = owner.GetPartyMemberList();		
		--�ж�player�Ƿ�Ϊowner�Ķ���
		local bIsPartyMember = false;
		if tParty then
			for i = 1, table.getn(tParty) do 
				if player.dwID == tParty[i] then
					bIsPartyMember = true;
					break;
				end
			end
		end
		--���playerΪ���ѻ����Լ�����ȡ������
		if bIsPartyMember or player.dwID == owner.dwID then
			return true;
		else
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce",GetEditorString(3, 9055) , "red")
			return false;
		end
	else 
		return false;	
	end
end

function OnPerOpen(doodad, player)
	local owner = GetPlayer(doodad.dwOwnerID);
	local doodadleftcount = doodad.GetCustomInteger1(0)

	if doodadleftcount <= 0 then
		return false;
	end
	--���owner���ߣ��Ҵ������״̬
	if owner then 
		--��ȡdoodad���������ڶ��顣
		--�����ɫ����һ�������У���ô�����������һ�������������г�ԱID��table����table��������1��ʼ��
		local tParty = owner.GetPartyMemberList();		
		--�ж�player�Ƿ�Ϊowner�Ķ���
		local bIsPartyMember = false;
		if tParty then
			for i = 1, table.getn(tParty) do 
				if player.dwID == tParty[i] then
					bIsPartyMember = true;
					break;
				end
			end
		end
		--���playerΪ���ѻ����Լ�����ȡ������
		if bIsPartyMember or player.dwID == owner.dwID then
			if  player.GetBuff(3448,1) then 
				player.SendSystemMessage(GetEditorString(3, 9056))
			else 
				player.AddBuff(0,99,2515,2,0)
				player.AddBuff(0,99,3448,1)
			end
			doodadleftcount = doodadleftcount - 1
			doodad.SetCustomInteger1(0,doodadleftcount)
			if doodadleftcount == 0 then
				doodad.SetDisappearFrames(4, false);
			end
			return true;
		else
			return false;
		end
	else 
		return false;	
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com