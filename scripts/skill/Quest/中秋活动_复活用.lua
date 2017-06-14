---------------------------------------------------------------------->
-- �ű�����:	G:/zhugan/client/scripts/skill/Quest/����_������.lua
-- ����ʱ��:	2012-9-12 16:09:11
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����-�����ֻ�.lua
-- ������    :  ����	
-- ����ʱ��  :  2007-6-21
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ����
-- ��������  :  �����ֻ�
-- ����Ч��  :  ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nReviveLife = 20000, nReviveMana = 20000},
	{nReviveLife = 20000, nReviveMana = 20000},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --���������
		tSkillData[dwSkillLevel].nReviveMana		--���������
	);
    

   		    
	--skill.BindBuff(1,1111,1);
	--skill.BindBuff(2,772,2);
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	-- skill.SetPublicCoolDown(16);	--����CD
	-- skill.SetNormalCoolDown(1, 37);
	--skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--  skill.nCostMana			= 0;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 10 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 2 then
		player.AcquireAchievement(58)
	end
	if player.IsAchievementAcquired(55) and player.IsAchievementAcquired(56) and player.IsAchievementAcquired(57) and player.IsAchievementAcquired(58) and player.IsAchievementAcquired(59) and player.IsAchievementAcquired(60) then
		player.AcquireAchievement(71)
	end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local level = player.GetSkillLevel(259)
	--player.AddBuff(0,99,3469,level)
	player.AddBuff(0, 99, 3861, 1)
	player.AddBuff(0, 99, 4009, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com