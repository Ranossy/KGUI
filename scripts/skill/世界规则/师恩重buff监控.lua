---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�������/ʦ����buff���.lua
-- ����ʱ��:	2015/4/15 17:58:22
-- �����û�:	mantong2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local bRemotePlayer = IsRemotePlayer(dwCharacterID)
	if bRemotePlayer then
		return
	end
	local GetMentorCache = GetMentorCache()
	local GetDirectMentorCache = GetDirectMentorCache()
	local nMentorCount = GetMentorCache.GetMentorCount(dwCharacterID)
	local nDirectMentorCount = GetDirectMentorCache.GetMentorCount(dwCharacterID)
	if nMentorCount < 1 and nDirectMentorCount < 1 then
		player.DelGroupBuff(8841, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com