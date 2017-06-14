------------------------------------------------
-- �ļ���    :  ���_�Ṧ_����ͻ.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����Ṧ
-- ��������  :  ����ͻ
-- ����Ч��  :  ��ǰ���һ�ξ��룬ͬʱ���н�·���ϵĵ�������˺�������ѣ��Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nDamageLevel = 1,nSpeed=100,nCostMana=125},
	{nDamageLevel = 2,nSpeed=105,nCostMana=226},
	{nDamageLevel = 3,nSpeed=110,nCostMana=314},
	{nDamageLevel = 4,nSpeed=115,nCostMana=401},
	{nDamageLevel = 5,nSpeed=120,nCostMana=488},
	{nDamageLevel = 6,nSpeed=125,nCostMana=576}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode     = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DASH_FORWARD, 
		16, 
		80
	);


	skill.BindBuff(1,880,1) --�������õ�����BUFF
	
	
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 550);

	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/6)*35;	-- �������ĵ�����
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	
    ----------------- ����������� ----------------------------------------  

    --�����뾶��Ҳ���ǹ�������Ч����
    --skill.nMaxRadius        = 25 * LENGTH_BASE;
    --skill.nAngleRange       = 32; 
	--skill.nAreaRadius	=	25 * LENGTH_BASE;
    --����֡��
	skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
	skill.nBulletVelocity   = 0;
    --����ϵĸ���
	skill.nBreakRate        = 0;
   
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
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com