------------------------------------------------
-- �ļ���    : ����ϵ_��ͨ_�����ܵ����˺�
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
	{nGlobalResistPercent = 10 },		
	{nGlobalResistPercent = 16 },		
	{nGlobalResistPercent = 20 },		
	{nGlobalResistPercent = 41 },		
	{nGlobalResistPercent = 46 },		
	{nGlobalResistPercent = 51 },		
	{nGlobalResistPercent = 72 },		
	{nGlobalResistPercent = 77 },		
	{nGlobalResistPercent = 82 },		
	{nGlobalResistPercent = 102 },				
};          
            
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.GLOBAL_RESIST_PERCENT,
		tSkillData[dwSkillLevel].nGlobalResistPercent,
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
		 player.AcquireAchievement(119)
	end
	if player.GetSkillLevel(41) > 0 and player.GetSkillLevel(42) > 0  and player.GetSkillLevel(43) > 0 and not player.IsAchievementAcquired(115) then
		player.AcquireAchievement(115)
	end
	player.AddAchievementCount(1150,2)
	
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