---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_�����ݵ�_�ڻ��ж�buff.lua
-- ����ʱ��:	2013/11/21 0:06:11
-- �����û�:	ZHOUMING
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
local tAchievementCount = {
	[175] = 3983,
	[176] = 4003,
}
function Apply(dwCharacterID)
	--print(10086)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(7232, 1)
	if buff then
		local nKillNum = buff.nCustomValue
		if nKillNum >= 12 then
			buff.nCustomValue = 0
			local scene = player.GetScene()
			if not tAchievementCount[scene.dwMapID] then
				Log(GetEditorString(6, 1689))
				return
			end
			local tPlayerList = scene.GetAllPlayer()
			if not tPlayerList or #tPlayerList == 0 then
				return
			end
			for i = 1, #tPlayerList do
				local playerSE = GetPlayer(tPlayerList[i])
				if not playerSE.IsAchievementAcquired(tAchievementCount[scene.dwMapID]) then
					playerSE.AddAchievementCount(tAchievementCount[scene.dwMapID],1)
				end
			end
		else
			--print(nKillNum)
			buff.nCustomValue = 0
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com