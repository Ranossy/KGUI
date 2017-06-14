---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�������/ʦͽͬ��BUFF.lua
-- ����ʱ��:	2015/3/24 15:51:31
-- �����û�:	mantong2
-- �ű�˵��:	����ʦͽ�������BUFF
----------------------------------------------------------------------<

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
----------------------------------------------------------------------<
	--���´�����BUFF
----------------------------------------------------------------------<
	local dwLookBuffID = 8844 								--���BUFF
	local nLookBuffLevel = 1
	local dwFlagBuffID = 8843								--˫��BUFF
	local nFlagBufflevel = 1
	local buff_Look = player.GetBuff(dwLookBuffID, nLookBuffLevel)
	local buff_double = player.GetBuff(dwFlagBuffID, nFlagBufflevel)
	local bParty = player.IsInParty()
	local nMaxLevel = player.nMaxLevel
	local nLevel = player.nLevel
	if buff_Look then
		if nLevel == nMaxLevel then							--��ɫ������return
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)
			player.DelBuff(8869, 1)
			--player.DelBuff(dwLookBuffID, nLookBuffLevel)
			return
		end
		if not bParty then 									-- ���ڶ����У�return
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)
			player.DelBuff(8869, 1)
			--player.DelBuff(dwLookBuffID, nLookBuffLevel)	--����˵��Ҫ�Լ�ɾ�Լ��������Լ������ɡ�
			return
		end
		local nBuffEndTime = buff_Look.GetEndTime()
		local nLogicFrameCount = GetLogicFrameCount()
		local nLeftTime = math.floor((nBuffEndTime - nLogicFrameCount) / 16 / 60)
		if nLeftTime < 5 then																		--BUFFʣ��ʱ��С��1���ӣ������BUFF
			player.AddBuff(0, 99, dwLookBuffID, nLookBuffLevel)
		end
	end
----------------------------------------------------------------------<
	--���´���˫��BUFF
----------------------------------------------------------------------<
	local tMemberList = player.GetPartyMemberList() 		--��ȡ�����б�
-----------------------���´�������BUFF�����-------------------------
	if buff_double then
		if bParty and #tMemberList < 1 then 					--����������������1
			player.DelBuff(dwFlagBuffID, nFlagBufflevel)					--ɾ��
			player.DelBuff(8869, 1)
		end
		for i = 1, #tMemberList do							--���������б�
			local dwMemberPlayerID = tMemberList[i]
			local MemberPlayer = GetPlayer(dwMemberPlayerID)
			local Buff_buff = player.GetBuff(2864, 1)
			local nLogicFrameCount = GetLogicFrameCount()
			local nBuffEndTime = buff_double.GetEndTime()
			local nLeftTime = math.floor((nBuffEndTime - nLogicFrameCount) / 16 / 60)
			if MemberPlayer and dwMemberPlayerID ~= dwCharacterID then
				if player.IsMyMentor(dwMemberPlayerID) or player.IsMyDirectMentor(dwMemberPlayerID) then		--ʦ���ж�
					if GetCharacterDistance(player.dwID, MemberPlayer.dwID) < 4096 then						--�����ж�
						if	nLeftTime < 3 then																		--ʣ��ʱ��
							player.AddBuff(0, 99, dwFlagBuffID, nFlagBufflevel)
							if not player.bNewFarmerFlag then
								player.AddBuff(0, 99, 8869, 1)
							end
							return
						end
						if not Buff_buff and not player.bNewFarmerFlag then
							player.AddBuff(0, 99, 8869, 1)
							return
						end
						return
					end
				end
			end
		end
		player.DelBuff(dwFlagBuffID, nFlagBufflevel)						--ɾ��
		player.DelBuff(8869, 1)
	else
--------------------���´���û��BUFF�����---------------------------
		if bParty and #tMemberList > 1 then
			for i = 1, #tMemberList do							--���������б�
				local dwMemberPlayerID = tMemberList[i]
				local MemberPlayer = GetPlayer(dwMemberPlayerID)
				if MemberPlayer and dwMemberPlayerID ~= dwCharacterID then
					if player.IsMyMentor(dwMemberPlayerID) or player.IsMyDirectMentor(dwMemberPlayerID) then		--ʦ���ж�
						if GetCharacterDistance(player.dwID, MemberPlayer.dwID) < 4096 then						--�����ж�
							player.AddBuff(0, 99, dwFlagBuffID, nFlagBufflevel)
							if not player.bNewFarmerFlag then
								player.AddBuff(0, 99, 8869, 1)
							end
							return
						end
					end
				end
			end
		end
	end
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com