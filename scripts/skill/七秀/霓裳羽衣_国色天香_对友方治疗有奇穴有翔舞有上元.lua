---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ɫ����_���ѷ�����.lua
-- ����ʱ��:	2013/5/11 13:18:48
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  �ź�	
-- ����ʱ��  :  2011-04-16
-- ����Ч��  :  ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nTherapy = 117*0.95, nTherapyRand = 117*0.1, nCostMana = 42 },
	{nTherapy = 122*0.95, nTherapyRand = 122*0.1, nCostMana = 42 },
	{nTherapy = 127*0.95, nTherapyRand = 127*0.1, nCostMana = 42 },
	{nTherapy = 132*0.95, nTherapyRand = 132*0.1, nCostMana = 42 },
	{nTherapy = 137*0.95, nTherapyRand = 137*0.1, nCostMana = 42 },
	{nTherapy = 142*0.95, nTherapyRand = 142*0.1, nCostMana = 42 },
	{nTherapy = 147*0.95, nTherapyRand = 147*0.1, nCostMana = 42 },
	{nTherapy = 152*0.95, nTherapyRand = 152*0.1, nCostMana = 42 },
	{nTherapy = 157*0.95, nTherapyRand = 157*0.1, nCostMana = 42 },
	{nTherapy = 162*0.95, nTherapyRand = 162*0.1, nCostMana = 42 },
	{nTherapy = 167*0.95, nTherapyRand = 167*0.1, nCostMana = 42 },
	{nTherapy = 172*0.95, nTherapyRand = 172*0.1, nCostMana = 42 },
	{nTherapy = 177*0.95, nTherapyRand = 177*0.1, nCostMana = 42 },
	{nTherapy = 182*0.95, nTherapyRand = 182*0.1, nCostMana = 42 },
	{nTherapy = 187*0.95, nTherapyRand = 187*0.1, nCostMana = 42 },
	{nTherapy = 192*0.95, nTherapyRand = 192*0.1, nCostMana = 42 },
	{nTherapy = 197*0.95, nTherapyRand = 197*0.1, nCostMana = 42 },
	{nTherapy = 202*0.95, nTherapyRand = 202*0.1, nCostMana = 42 },
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- ���ƻ���ֵ
		tSkillData[dwSkillLevel].nTherapy/3,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ���Ƹ���ֵ
		tSkillData[dwSkillLevel].nTherapyRand/3,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY, -- Call����
		0,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��������_��ɫ����_���ѷ�����.lua",
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF

	skill.AddSlowCheckDestOwnBuff(680, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckDestOwnBuff(681, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana = tSkillData[dwSkillLevel].nCostMana;
	
	skill.AddCheckSelfLearntSkill(5887, 1, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	--------------- ����������� ----------------------------------------------------------------------
   skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- ����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- ����ʩ�����뾶
	skill.nAngleRange = 256; 									-- ʩ�ŽǶ�
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nBulletVelocity = 0;					-- �ӵ��ٶȣ���λ ��/֡
	 if dwSkillLevel < 18 then
  		skill.nChannelInterval = 20*1.04*1.05*1.05*1.3;
  	else
  		skill.nChannelInterval = 29*1.04*1.05*1.05*1.3;     
 	end
	--skill.nChannelFrame = 40;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBreakRate = 1024;					--����ϵĸ���,Ĭ��1024��ʾһ�������
    
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
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if not player.GetBuff(1383, 2) and not player.GetBuff(8528,1) then
		player.DelBuff(409, nLevel + 7)
		player.DelBuff(409, nLevel + 14)	
		player.DelBuff(409, nLevel)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com