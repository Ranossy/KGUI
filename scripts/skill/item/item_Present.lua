--������Ե������� ǧ������ һͳ����
--�书����
--��Ʒ���߼���-CDר��
--����Ч����˵���������߼���CDר��
--����ǿ 2009-02-20

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nAttraction = 2},
    {nAttraction = 4},  --���Ѷȵ�����6���ȼ�
    {nAttraction = 6},
    {nAttraction = 8},
    {nAttraction = 10},
    {nAttraction = 12},
    {nAttraction = 14},
    {nAttraction = 16},
    {nAttraction = 18},
    {nAttraction = 20},
    {nAttraction = 5},
	{nAttraction = 20},
	{nAttraction = 2}, -- лʦ��
    {nAttraction = 4}, -- лʦ��
    {nAttraction = 6}, -- лʦ��
    {nAttraction = 8}, -- лʦ��
	
	

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.ADD_FELLOWSHIP_ATTRACTION,								-- ħ������
   		tSkillData[dwSkillLevel].nAttraction,							-- ����ֵ1
   		0																-- ����ֵ2
   		);

 if skill.dwLevel == 6 then
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/item_Present.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
 end

 if skill.dwLevel == 9 then
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/item_Present_�ɾ�.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
 end

 if skill.dwLevel == 13 then
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/лʦ��.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
 end
 if skill.dwLevel == 14 then
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/лʦ��1.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
 end
  if skill.dwLevel == 15 then
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/item/лʦ��2.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
  end
	if skill.dwLevel == 16 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
			"skill/item/лʦ��3.lua",				-- ����ֵ1
			0														-- ����ֵ2
			);
	end
  ----------------- ʱ����� -------------------------------------------------
    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);						-- ����CD 1.5��
    skill.SetNormalCoolDown(1, 216);
    
    skill.nPrepareFrames  	= 38;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
    skill.nMaxRadius    = 6 * LENGTH_BASE;
    skill.nAngleRange   = 128; 
    skill.nBrokenRate   = PERCENT_BASE;	
    --����֡��
    --skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
	          
    return true;
end    

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddAchievementCount(323, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com