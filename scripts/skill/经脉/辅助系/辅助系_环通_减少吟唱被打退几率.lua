------------------------------------------------
-- �ļ���    : ����ϵ_��ͨ_�������������˼���
-- ������    : zhangqi
-- ����ʱ��  : 2009-06-08
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : 
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/VerationTable.lua")

tSkillData =
{
	{nBeatBackRate = -60 },		
	{nBeatBackRate = -92 },		
	{nBeatBackRate = -123 },		
	{nBeatBackRate = -246 },		
	{nBeatBackRate = -276 },		
	{nBeatBackRate = -307 },		
	{nBeatBackRate = -430 },		
	{nBeatBackRate = -460 },		
	{nBeatBackRate = -492 },		
	{nBeatBackRate = -614 },				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		tSkillData[dwSkillLevel].nBeatBackRate,
		0
	);
	
    return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 10 then
		 player.AcquireAchievement(118)
	end
	if player.GetSkillLevel(41) > 0 and player.GetSkillLevel(42) > 0  and player.GetSkillLevel(43) > 0 and not player.IsAchievementAcquired(115) then
		player.AcquireAchievement(115)
	end
	player.AddAchievementCount(1149,2)

	local nAchi = 0
	for i = 1,10 do
		if player.GetSkillLevel(tVenationEffectID[i]) == 10 then
			nAchi = nAchi +1
		end
	end
	if nAchi >= 10 and not player.IsAchievementAcquired(127) then
		player.AcquireAchievement(127)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com